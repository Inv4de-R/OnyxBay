/obj/machinery/mecha_part_fabricator
	icon = 'icons/obj/robotics.dmi'
	icon_state = "fab-idle"
	name = "Exosuit Fabricator"
	desc = "A machine used for construction of robotcs and mechas."
	layer = BELOW_OBJ_LAYER
	density = 1
	anchored = 1
	idle_power_usage = 20 WATTS
	active_power_usage = 5 KILO WATTS
	req_access = list(access_robotics)
	clicksound = 'sound/effects/using/console/press2.ogg'
	clickvol = 30


	var/speed = 1
	var/mat_efficiency = 1
	var/list/materials = list(MATERIAL_STEEL = 0, MATERIAL_GLASS = 0, MATERIAL_GOLD = 0, MATERIAL_SILVER = 0, MATERIAL_DIAMOND = 0, MATERIAL_PLASMA = 0, MATERIAL_URANIUM = 0)
	var/res_max_amount = 200000

	var/datum/research/files
	var/list/datum/design/queue = list()
	var/progress = 0
	var/busy = 0

	var/list/categories = list()
	var/category = null
	var/manufacturer = null
	var/sync_message = ""

/obj/machinery/mecha_part_fabricator/Initialize()
	. = ..()

	component_parts = list()
	component_parts += new /obj/item/circuitboard/mechfab(src)
	component_parts += new /obj/item/stock_parts/matter_bin(src)
	component_parts += new /obj/item/stock_parts/matter_bin(src)
	component_parts += new /obj/item/stock_parts/manipulator(src)
	component_parts += new /obj/item/stock_parts/micro_laser(src)
	component_parts += new /obj/item/stock_parts/console_screen(src)
	RefreshParts()

	manufacturer = basic_robolimb.company

	files = new /datum/research(src) //Setup the research data holder.
	update_categories()

/obj/machinery/mecha_part_fabricator/Process()
	..()
	if(stat)
		return
	if(busy)
		update_use_power(POWER_USE_ACTIVE)
		progress += speed
		check_build()
	else
		update_use_power(POWER_USE_IDLE)
	update_icon()

/obj/machinery/mecha_part_fabricator/on_update_icon()
	ClearOverlays()
	if(panel_open)
		icon_state = "fab-o"
	else
		icon_state = "fab-idle"
	if(busy)
		AddOverlays("fab-active")

/obj/machinery/mecha_part_fabricator/dismantle()
	for(var/f in materials)
		eject_materials(f, -1)
	..()

/obj/machinery/mecha_part_fabricator/RefreshParts()
	res_max_amount = 0
	for(var/obj/item/stock_parts/matter_bin/M in component_parts)
		res_max_amount += M.rating * 100000 // 200k -> 600k
	var/T = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		T += M.rating
	mat_efficiency = 1 - (T - 1) / 4 // 1 -> 0.5
	for(var/obj/item/stock_parts/micro_laser/M in component_parts) // Not resetting T is intended; speed is affected by both
		T += M.rating
	speed = T / 2 // 1 -> 3

/obj/machinery/mecha_part_fabricator/attack_hand(mob/user)
	if(..())
		return
	if(!allowed(user))
		return
	tgui_interact(user)

/obj/machinery/mecha_part_fabricator/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)

	if(!ui)
		ui = new(user, src, "MechaFabricator")
		ui.open()

/obj/machinery/mecha_part_fabricator/tgui_data(mob/user)
	var/datum/design/current = queue.len ? queue[1] : null
	var/data = list(
		"current" = current?.name,
		"queue" = get_queue_names(),
		"buildable" = get_build_options(),
		"category" = category,
		"categories" = categories
	)

	if(GLOB.all_robolimbs)
		var/list/T = list()

		for(var/A in GLOB.all_robolimbs)
			var/datum/robolimb/R = GLOB.all_robolimbs[A]

			if(R.unavailable_at_fab || R.applies_to_part.len)
				continue

			T += list(list(
				"id" = A,
				"company" = R.company
			))

		data["manufacturers"] = T
		data["manufacturer"] = manufacturer

	data["materials"] = get_materials()
	data["maxres"] = res_max_amount
	data["sync"] = sync_message

	if(current)
		data["builtperc"] = round((progress / current.time) * 100)

	return data

/obj/machinery/mecha_part_fabricator/tgui_act(action, params)
	. = ..()

	if(.)
		return

	switch(action)
		if("build")
			add_to_queue(text2num(params["build"]))
			. = TRUE
		if("remove")
			remove_from_queue(text2num(params["remove"]))
			. = TRUE
		if("category")
			if(params["category"] in categories)
				category = params["category"]
				. = TRUE
		if("eject")
			eject_materials(params["eject"], text2num(params["amount"]))
			. = TRUE
		if("sync")
			sync()
			. = TRUE
		if("manufacturer")
			manufacturer = params["manufacturer"]
			. = TRUE

	if(.)
		tgui_update()

/obj/machinery/mecha_part_fabricator/attackby(obj/item/I, mob/user)
	if(busy)
		to_chat(user, "<span class='notice'>\The [src] is busy. Please wait for completion of previous operation.</span>")
		return 1
	if(default_deconstruction_screwdriver(user, I))
		return
	if(default_deconstruction_crowbar(user, I))
		return
	if(default_part_replacement(user, I))
		return

	if(!istype(I, /obj/item/stack/material))
		return ..()

	var/obj/item/stack/material/stack = I
	var/material = stack.material.name
	var/stack_singular = "[stack.material.use_name] [stack.material.sheet_singular_name]" // eg "steel sheet", "wood plank"
	var/stack_plural = "[stack.material.use_name] [stack.material.sheet_plural_name]" // eg "steel sheets", "wood planks"
	var/amnt = stack.perunit

	if(stack.uses_charge)
		return

	if(!(material in materials))
		to_chat(user, "<span class=warning>\The [src] does not accept [stack_plural]!</span>")
		return

	if(materials[material] + amnt <= res_max_amount)
		if(stack && stack.amount >= 1)
			var/count = 0
			AddOverlays("fab-load-metal")
			spawn(10)
				CutOverlays("fab-load-metal")
			while(materials[material] + amnt <= res_max_amount && stack.amount >= 1)
				materials[material] += amnt
				stack.use(1)
				count++
			to_chat(user, "You insert [count] [count==1 ? stack_singular : stack_plural] into the fabricator.")// 0 steel sheets, 1 steel sheet, 2 steel sheets, etc

			update_busy()
	else
		to_chat(user, "The fabricator cannot hold more [stack_plural].")// use the plural form even if the given sheet is singular


/obj/machinery/mecha_part_fabricator/emag_act(remaining_charges, mob/user)
	switch(emagged)
		if(0)
			playsound(src.loc, 'sound/effects/computer_emag.ogg', 25)
			emagged = 0.5
			visible_message("\icon[src] <b>[src]</b> beeps: \"DB error \[Code 0x00F1\]\"")
			sleep(10)
			visible_message("\icon[src] <b>[src]</b> beeps: \"Attempting auto-repair\"")
			sleep(15)
			visible_message("\icon[src] <b>[src]</b> beeps: \"User DB corrupted \[Code 0x00FA\]. Truncating data structure...\"")
			sleep(30)
			visible_message("\icon[src] <b>[src]</b> beeps: \"User DB truncated. Please contact your [GLOB.using_map.company_name] system operator for future assistance.\"")
			req_access = null
			emagged = 1
			return 1
		if(0.5)
			visible_message("\icon[src] <b>[src]</b> beeps: \"DB not responding \[Code 0x0003\]...\"")
		if(1)
			visible_message("\icon[src] <b>[src]</b> beeps: \"No records in User DB\"")

/obj/machinery/mecha_part_fabricator/proc/update_busy()
	if(queue.len)
		if(can_build(queue[1]))
			busy = 1
		else
			busy = 0
	else
		busy = 0

	tgui_update()

/obj/machinery/mecha_part_fabricator/proc/add_to_queue(index)
	var/datum/design/D = files.known_designs[index]
	queue += D
	update_busy()

/obj/machinery/mecha_part_fabricator/proc/remove_from_queue(index)
	if(index == 1)
		progress = 0
	queue.Cut(index, index + 1)
	update_busy()

/obj/machinery/mecha_part_fabricator/proc/can_build(datum/design/D)
	for(var/M in D.materials)
		if(materials[M] <= D.materials[M] * mat_efficiency)
			return 0
	return 1

/obj/machinery/mecha_part_fabricator/proc/check_build()
	if(!queue.len)
		progress = 0
		return
	var/datum/design/D = queue[1]
	if(!can_build(D))
		progress = 0
		return
	if(D.time > progress)
		return
	for(var/M in D.materials)
		materials[M] = max(0, materials[M] - D.materials[M] * mat_efficiency)
	if(D.build_path)
	//places fabricated item to right side of fabricator
		var/obj/new_item = D.Fabricate(locate(loc.x+1,loc.y,loc.z), src)
		visible_message("\The [src] pings, indicating that \the [D] is complete.", "You hear a ping.")
		if(mat_efficiency != 1)
			if(new_item.matter && new_item.matter.len > 0)
				for(var/i in new_item.matter)
					new_item.matter[i] = new_item.matter[i] * mat_efficiency
	remove_from_queue(1)

/obj/machinery/mecha_part_fabricator/proc/get_queue_names()
	. = list()
	for(var/i = 2 to queue.len)
		var/datum/design/D = queue[i]
		. += D.name

/obj/machinery/mecha_part_fabricator/proc/get_build_options()
	. = list()
	for(var/i = 1 to files.known_designs.len)
		var/datum/design/D = files.known_designs[i]
		if(!D.build_path || !(D.build_type & MECHFAB))
			continue
		. += list(list("name" = D.name, "id" = i, "category" = D.category, "resourses" = get_design_resourses(D), "time" = get_design_time(D), "icon" = icon2base64html(D.build_path)))

/obj/machinery/mecha_part_fabricator/proc/get_design_resourses(datum/design/D)
	var/list/F = list()
	for(var/T in D.materials)
		F += "[capitalize(T)]: [D.materials[T] * mat_efficiency]"
	return english_list(F, and_text = ", ")

/obj/machinery/mecha_part_fabricator/proc/get_design_time(datum/design/D)
	return time2text(round(10 * D.time / speed), "mm:ss")

/obj/machinery/mecha_part_fabricator/proc/update_categories()
	categories = list()
	if(files)
		for(var/datum/design/D in files.known_designs)
			if(!D.build_path || !(D.build_type & MECHFAB))
				continue
			categories |= D.category
	if(!category || !(category in categories))
		category = categories[1]

/obj/machinery/mecha_part_fabricator/proc/get_materials()
	. = list()
	for(var/T in materials)
		. += list(list("mat" = capitalize(T), "amt" = materials[T], "icon" = icon2base64html(get_icon_for_material(T))))

/obj/machinery/mecha_part_fabricator/proc/eject_materials(material, amount) // 0 amount = 0 means ejecting a full stack; -1 means eject everything
	var/recursive = amount == -1 ? 1 : 0
	material = lowertext(material)
	var/mattype
	switch(material)
		if(MATERIAL_STEEL)
			mattype = /obj/item/stack/material/steel
		if(MATERIAL_GLASS)
			mattype = /obj/item/stack/material/glass
		if(MATERIAL_GOLD)
			mattype = /obj/item/stack/material/gold
		if(MATERIAL_SILVER)
			mattype = /obj/item/stack/material/silver
		if(MATERIAL_DIAMOND)
			mattype = /obj/item/stack/material/diamond
		if(MATERIAL_PLASMA)
			mattype = /obj/item/stack/material/plasma
		if(MATERIAL_URANIUM)
			mattype = /obj/item/stack/material/uranium
		else
			return
	var/obj/item/stack/material/S = new mattype(loc)
	if(amount <= 0)
		amount = S.max_amount
	var/ejected = min(round(materials[material] / S.perunit), amount)
	S.amount = min(ejected, amount)
	if(S.amount <= 0)
		qdel(S)
		return
	materials[material] -= ejected * S.perunit
	if(recursive && materials[material] >= S.perunit)
		eject_materials(material, -1)
	update_busy()

/obj/machinery/mecha_part_fabricator/proc/sync()
	sync_message = "Error: no console found."
	for(var/obj/machinery/computer/rdconsole/RDC in get_area_all_atoms(get_area(src)))
		if(!RDC.sync)
			continue
		for(var/datum/tech/T in RDC.files.known_tech)
			files.AddTech2Known(T)
		for(var/datum/design/D in RDC.files.known_designs)
			files.AddDesign2Known(D)
		files.RefreshResearch()
		sync_message = "Sync complete."
	update_categories()

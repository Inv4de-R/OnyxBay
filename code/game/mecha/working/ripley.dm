/obj/mecha/working/ripley
	desc = "Autonomous Power Loader Unit. The workhorse of the exosuit world."
	name = "APLU \"Ripley\""
	icon_state = "ripley"
	initial_icon = "ripley"
	base_color = "#DFD472"
	step_in = 6
	max_temperature = 20000
	health = 200
	wreckage = /obj/effect/decal/mecha_wreckage/ripley
	cargo_capacity = 10
	var/hides = 0

/obj/mecha/working/ripley/Destroy()
	for(var/atom/movable/A in src.cargo)
		A.dropInto(loc)
		var/turf/T = loc
		if(istype(T))
			T.Entered(A)
		step_rand(A)
	cargo.Cut()

	return ..()

/obj/mecha/working/ripley/on_update_icon()
	..()
	if(hides)
		ClearOverlays()
		if(hides < 3)
			AddOverlays(OVERLAY("mecha.dmi", occupant ? "ripley-g" : "ripley-g-open"))
		else
			AddOverlays(OVERLAY("mecha.dmi", occupant ? "ripley-g-full" : "ripley-g-full-open"))

/obj/mecha/working/ripley/firefighter
	desc = "Standart APLU chassis was refitted with additional thermal protection and cistern."
	name = "APLU \"Firefighter\""
	icon_state = "firefighter"
	initial_icon = "firefighter"
	max_temperature = 65000
	health = 250
	lights_power = 8
	damage_absorption = list("fire"=0.5,"bullet"=0.8,"bomb"=0.5)
	wreckage = /obj/effect/decal/mecha_wreckage/ripley/firefighter

/obj/mecha/working/ripley/deathripley
	desc = "OH SHIT IT'S THE DEATHSQUAD WE'RE ALL GONNA DIE!"
	name = "DEATH-RIPLEY"
	icon_state = "deathripley"
	initial_icon = "deathripley"
	base_color = "#880015"
	step_in = 2
	opacity=0
	lights_power = 60
	wreckage = /obj/effect/decal/mecha_wreckage/ripley/deathripley
	step_energy_drain = 0

/obj/mecha/working/ripley/deathripley/Initialize()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/tool/safety_clamp
	ME.attach(src)
	. = ..()

/obj/mecha/working/ripley/mining
	desc = "An old, dusty mining ripley."
	name = "APLU \"Miner\""

/obj/mecha/working/ripley/mining/Initialize()
	//Attach drill
	if(prob(25)) //Possible diamond drill... Feeling lucky?
		var/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill/D = new /obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill
		D.attach(src)
	else
		var/obj/item/mecha_parts/mecha_equipment/tool/drill/D = new /obj/item/mecha_parts/mecha_equipment/tool/drill
		D.attach(src)

	//Attach hydrolic clamp
	var/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/HC = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
	HC.attach(src)
	. = ..()

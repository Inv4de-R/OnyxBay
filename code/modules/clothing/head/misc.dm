

/obj/item/clothing/head/centhat
	name = "\improper CentComm. hat"
	icon_state = "centcom"
	item_state_slots = list(
		slot_l_hand_str = "centhat",
		slot_r_hand_str = "centhat",
		)
	desc = "It's good to be emperor."
	siemens_coefficient = 0.9
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/hairflower
	name = "hair flower pin"
	icon_state = "hairflower"
	desc = "Smells nice."
	slot_flags = SLOT_HEAD | SLOT_EARS
	body_parts_covered = NO_BODYPARTS

/obj/item/clothing/head/hairflower/blue
	icon_state = "hairflower_blue"

/obj/item/clothing/head/hairflower/pink
	icon_state = "hairflower_pink"

/obj/item/clothing/head/hairflower/yellow
	icon_state = "hairflower_yellow"

/obj/item/clothing/head/hairflower/white
	icon_state = "hairflower_white"

/obj/item/clothing/head/hairflower/purple
	icon_state = "hairflower_purple"

/obj/item/clothing/head/hairflower/bow
	icon_state = "bow"
	name = "hair bow"
	desc = "A ribbon tied into a bow with a clip on the back to attach to hair."

/obj/item/clothing/head/powdered_wig
	name = "powdered wig"
	desc = "A powdered wig."
	icon_state = "pwig"
	item_state = "pwig"
	armor = list(melee = 5, bullet = 5, laser = 0,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/warfarecap
    name = "red peaked cap"
    desc = "Makes you want to step on a landmine."
    icon_state = "redoffcap"

/obj/item/clothing/head/that
	name = "top-hat"
	desc = "It's an amish looking hat."
	icon_state = "tophat"
	item_state = "tophat"
	siemens_coefficient = 0.9
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/redcoat
	name = "redcoat's hat"
	icon_state = "redcoat"
	desc = "<i>'I guess it's a redhead.'</i>"
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/mailman
	name = "mail cap"
	icon_state = "mailman"
	desc = "<i>Choo-choo</i>!"
	body_parts_covered = NO_BODYPARTS

/obj/item/clothing/head/plaguedoctorhat
	name = "plague doctor's hat"
	desc = "These were once used by Plague doctors. They're pretty much useless."
	icon_state = "plaguedoctor"
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/hasturhood
	name = "hastur's hood"
	desc = "It's unspeakably stylish."
	icon_state = "hasturhood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/nursehat
	name = "nurse's hat"
	desc = "It allows quick identification of trained medical personnel."
	icon_state = "nursehat"
	siemens_coefficient = 0.9
	body_parts_covered = NO_BODYPARTS

/obj/item/clothing/head/syndicatefake
	name = "red space-helmet replica"
	item_state_slots = list(
		slot_l_hand_str = "syndicate-helm-black-red",
		slot_r_hand_str = "syndicate-helm-black-red",
		)
	icon_state = "syndicate"
	desc = "A plastic replica of a bloodthirsty syndicate's space helmet, you'll look just like a real murderous criminal operative in this! This is a toy, it is not made for use in space!"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	siemens_coefficient = 2.0
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/cueball
	name = "cueball helmet"
	desc = "A large, featureless white orb mean to be worn on your head. How do you even see out of this thing?"
	icon_state = "cueball"
	item_state = "cueball"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/head/cardborg
	name = "cardborg helmet"
	desc = "A helmet made out of a box."
	icon_state = "cardborg_h"
	item_state = "cardborg_h"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 6, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/cardborg/Initialize()
	. = ..()

	AddComponent(/datum/component/cardborg)

/obj/item/clothing/head/justice
	name = "justice hat"
	desc = "fight for what's righteous!"
	icon_state = "justicered"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|EYES

/obj/item/clothing/head/justice/blue
	icon_state = "justiceblue"

/obj/item/clothing/head/justice/yellow
	icon_state = "justiceyellow"

/obj/item/clothing/head/justice/green
	icon_state = "justicegreen"

/obj/item/clothing/head/justice/pink
	icon_state = "justicepink"

/obj/item/clothing/head/rabbitears
	name = "rabbit ears"
	desc = "Wearing these makes you looks useless, and only good for your sex appeal."
	icon_state = "bunny"
	body_parts_covered = NO_BODYPARTS

/obj/item/clothing/head/flatcap
	name = "flat cap"
	desc = "A working man's cap."
	icon_state = "flat_cap"
	item_state_slots = list(
		slot_l_hand_str = "det_hat",
		slot_r_hand_str = "det_hat",
		)
	siemens_coefficient = 0.9
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/pirate
	name = "pirate hat"
	desc = "Yarr."
	icon_state = "pirate"
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/hgpiratecap
	name = "pirate hat"
	desc = "Yarr."
	icon_state = "hgpiratecap"
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/bandana
	name = "pirate bandana"
	desc = "Yarr."
	icon_state = "bandana"
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/bandana/green
	name = "green bandana"
	desc = "It's a green bandana with some fine nanotech lining."
	icon_state = "greenbandana"
	item_state = "greenbandana"

/obj/item/clothing/head/bandana/orange //themij: Taryn Kifer
	name = "orange bandana"
	desc = "An orange piece of cloth, worn on the head."
	icon_state = "orange_bandana"

/obj/item/clothing/head/bowler
	name = "bowler-hat"
	desc = "Gentleman, elite aboard!"
	icon_state = "bowler"
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

//stylish bs12 hats

/obj/item/clothing/head/bowlerhat
	name = "bowler hat"
	icon_state = "bowler_hat"
	desc = "For the gentleman of distinction."
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/beaverhat
	name = "beaver hat"
	icon_state = "beaver_hat"
	desc = "Soft felt makes this hat both comfortable and elegant."
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/boaterhat
	name = "boater hat"
	icon_state = "boater_hat"
	desc = "The ultimate in summer fashion."
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/fedora
	name = "fedora"
	icon_state = "fedora"
	desc = "A sharp, stylish hat."
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/feathertrilby
	name = "feather trilby"
	icon_state = "feather_trilby"
	desc = "A sharp, stylish hat with a feather."
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/fez
	name = "fez"
	icon_state = "fez"
	desc = "You should wear a fez. Fezzes are cool."
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0)

//end bs12 hats

/obj/item/clothing/head/witchwig
	name = "witch costume wig"
	desc = "Eeeee~heheheheheheh!"
	icon_state = "witch"
	flags_inv = BLOCKHAIR
	siemens_coefficient = 2.0
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/chicken
	name = "chicken suit head"
	desc = "Bkaw!"
	icon_state = "chickenhead"
	item_state_slots = list(
		slot_l_hand_str = "chickensuit",
		slot_r_hand_str = "chickensuit",
		)
	flags_inv = BLOCKHAIR
	siemens_coefficient = 0.7
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/bearpelt
	name = "bear pelt hat"
	desc = "Fuzzy."
	icon_state = "bearpelt"
	siemens_coefficient = 0.7
	armor = list(melee = 15, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/xenos
	name = "xenos helmet"
	icon_state = "xenos"
	item_state_slots = list(
		slot_l_hand_str = "xenos_helm",
		slot_r_hand_str = "xenos_helm",
		)
	desc = "A helmet made out of chitinous alien hide."
	w_class = ITEM_SIZE_NORMAL
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	siemens_coefficient = 2.0
	body_parts_covered = HEAD|FACE|EYES
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/philosopher_wig
	name = "natural philosopher's wig"
	desc = "A stylish monstrosity unearthed from Earth's Renaissance period. With this most distinguish'd wig, you'll be ready for your next soiree!"
	icon_state = "philosopher_wig"
	item_state_slots = list(
		slot_l_hand_str = "pwig",
		slot_r_hand_str = "pwig",
		)
	flags_inv = BLOCKHAIR
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 5, laser = 0,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/hijab
	name = "hijab"
	desc = "A veil which is wrapped to cover the head and chest."
	icon_state = "hijab"
	flags_inv = BLOCKHAIR
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 0, bomb = 15, bio = 0)

/obj/item/clothing/head/kippa
	name = "kippa"
	desc = "A small, brimless cap."
	icon_state = "kippa"
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/turban
	name = "turban"
	desc = "A sturdy cloth, worn around the head."
	icon_state = "turban"
	body_parts_covered = NO_BODYPARTS
	flags_inv = BLOCKHEADHAIR //Shows beards!
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/cowboy_hat
	name = "cowboy hat"
	desc = "A wide-brimmed hat, in the prevalent style of America's frontier period. By SolGov law, you are required to wear this hat while watching True Grit."
	icon_state = "cowboyhat"
	item_state = "cowboy_hat"
	armor = list(melee = 10, bullet = 10, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/taqiyah
	name = "taqiyah"
	desc = "A short, rounded skullcap usually worn for religious purposes."
	icon_state = "taqiyah"
	item_state = "taqiyah"
	body_parts_covered = NO_BODYPARTS
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/tank
	name = "padded cap"
	desc = "A padded skullcup for those prone to bumping their heads against hard surfaces."
	icon_state = "tank"
	flags_inv = BLOCKHEADHAIR
	color = "#5f5f5f"
	armor = list(melee = 25, bullet = 10, laser = 10,energy = 5, bomb = 10, bio = 0)

/obj/item/clothing/head/tank/olive
	color = "#727c58"

/obj/item/clothing/head/tank/tan
	color = "#ae9f79"

/obj/item/clothing/head/helmet/facecover
	name = "face cover"
	desc = "A helmet made of plastic. It's completely opaque. This will stop the stare."
	icon_state = "facecover"
	tint = TINT_BLIND
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	visor_body_parts_covered = NO_BODYPARTS
	flash_protection = FLASH_PROTECTION_MAJOR
	armor = list(melee = 20, bullet = 10, laser = 10,energy = 5, bomb = 5, bio = 0)

/obj/item/clothing/head/rasta
	name = "rasta hat"
	desc = "U good bruh?"
	icon_state = "rastacap"
	item_state = "rastacap"

/obj/item/clothing/head/sombrero
	name = "sombrero"
	icon_state = "sombrero"
	item_state = "sombrero"
	desc = "You can practically taste the fiesta."
	armor = list(melee = 10, bullet = 10, laser = 5,energy = 0, bomb = 30, bio = 0)

/obj/item/clothing/head/samura_hat
	name = "samurai hat"
	icon_state = "samura_hat"
	item_state = "samura_hat"
	desc = "Asian straw hat with cool stripes of fabric throughout the brim."
	armor = list(melee = 10, bullet = 10, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/agua_helmet
	name = "head-worn aquarium"
	icon_state = "agua_helmet"
	item_state = "agua_helmet"
	desc = "Water with some fishes in the glass aquarium."
	armor = list(melee = 10, bullet = 10, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/crown
	name = "crown"
	icon_state = "crown"
	item_state = "crown"
	desc = "Royal gold worthy of a true ruler of the world."
	armor = list(melee = 10, bullet = 10, laser = 5,energy = 0, bomb = 0, bio = 0)

/obj/item/clothing/head/antenna
	name = "antenna"
	icon_state = "antenna"
	item_state = "antenna"
	desc = "People of the past thought that alien species walked around with such antennas. It turned out that they really did."

/obj/item/clothing/head/tiara
	name = "tiara"
	icon_state = "tiara"
	item_state = "tiara"
	desc = "Silver crown adorned with jewelry stones."

/obj/item/clothing/head/vpp_cap
	name = "vpp cap"
	icon_state = "vpp_cap"
	item_state = "vpp_cap"
	desc = "Green cap of unknown design. The emblem proudly bears the abbreviation V.P.P."

/obj/item/clothing/head/necro_hood
	name = "Necromancer hood"
	icon_state = "necro_hood"
	item_state = ""
	desc = "A strange hood that reeks of dread."
	armor = list(melee = 30, bullet = 30, laser = 30, energy = 30, bomb = 15, bio = 40)
	siemens_coefficient = 0.8
	wizard_garb = TRUE
	flags_inv = HIDEEARS|BLOCKHEADHAIR
	body_parts_covered = HEAD|EYES

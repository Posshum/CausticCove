/obj/item/clothing/suit/roguetown/shirt/robe/selune
	name = "Moonlight Robe"
	desc = "A moon-silver robe."
	armor = ARMOR_PADDED
	icon_state = "selune"
	icon = 'modular_rmh/icons/clothing/vladegeg/selune.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/selune.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/selune_sleeves.dmi'
	slot_flags = ITEM_SLOT_SHIRT | ITEM_SLOT_ARMOR

//CRAFTING

/datum/crafting_recipe/roguetown/sewing/selune
	name = "Moonlight Robe"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/selune)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

//LOADOUT

/datum/loadout_item/selune
	name = "Moonlight Robe"
	path = /obj/item/clothing/suit/roguetown/shirt/robe/selune
	sort_category = "Shirts"
	triumph_cost = 3

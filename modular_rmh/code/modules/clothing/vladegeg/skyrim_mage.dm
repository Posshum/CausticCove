/obj/item/clothing/suit/roguetown/shirt/robe/skyrim_mage
	name = "Northern Mage Robes"
	desc = "Simple but finely woven robes favored by the mages. The cloth is light, warm, and practical."
	armor = ARMOR_PADDED
	icon_state = "mage"
	icon = 'modular_rmh/icons/clothing/vladegeg/skyrim_mage.dmi'
	mob_overlay_icon = 'modular_rmh/icons/clothing/vladegeg/onmob/skyrim_mage.dmi'
	sleeved = 'modular_rmh/icons/clothing/vladegeg/onmob/helpers/skyrim_mage_sleeves.dmi'
	slot_flags = ITEM_SLOT_SHIRT | ITEM_SLOT_ARMOR

//CRAFTING

/datum/crafting_recipe/roguetown/sewing/skyrim_mage
	name = "Northern Mage Robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/skyrim_mage)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

//LOADOUT

/datum/loadout_item/skyrim_mage
	name = "Northern Mage Robes"
	path = /obj/item/clothing/suit/roguetown/shirt/robe/skyrim_mage
	sort_category = "Shirts"
	triumph_cost = 3

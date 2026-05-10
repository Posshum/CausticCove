/obj/item/quiver/bolt/piercers
	name = "piercer's heavy bolt pouch"
	desc = "A heavy leather canister that can be used to carry heavier bolts. Casketed inside are the missiles that, whether launched from a mounted ballista or handheld siegebow, will devastate without quarter."
	icon_state = "boltpouch0"
	item_state = "boltpouch"
	max_storage = 4 //Piercer's Pouch can only carry 4 bolts as opposed to 8 like the siege bow. Don't lose them!
	sellprice = 10
	allowed_ammo_type = /obj/item/ammo_casing/caseless/rogue/piercers_bolt

/obj/item/quiver/bolt/piercers/full/Initialize()
	..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/piercers_bolt/A = new()
		arrows += A
	update_icon()

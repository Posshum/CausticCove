/mob/living/simple_animal/hostile/retaliate/rogue/spider/rock
	icon_state = "spiderrock"
	icon_living = "spiderrock"
	icon_dead = "spiderrock-dead"
	icon = 'modular_deserttown/icons/mob/monster/spider.dmi' //CC Edit - Sprite Path
	name = "rockspider"

	//CC Edit - Description + Damage Values + Slow Attack Speed, make them unique and dangerous. 
	desc = "These beasts are similar to their beespider cousins, however, they feature recessed heads and hairy brown bodies. Their mandibles are sharp, having a spring-trap design as they need to realign their mandibles to spring forth with every crushing blow."
	melee_damage_lower = 38
	melee_damage_upper = 48
	melee_cooldown = (CLICK_CD_MELEE * 3) //36 ticks, every~ 3 seconds. They're slow, but can deliver a nasty punch.
	//CC Edit End
	
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 1,
							/obj/item/natural/silk = 2, 
							/obj/item/reagent_containers/food/snacks/rogue/honey/spider = 1,
							/obj/item/alch/viscera = 1)
	perfect_butcher_results = list (/obj/item/reagent_containers/food/snacks/rogue/meat/spider = 2,
							/obj/item/natural/silk = 3, 
							/obj/item/reagent_containers/food/snacks/rogue/honey/spider = 1, 
							/obj/item/alch/viscera = 1)

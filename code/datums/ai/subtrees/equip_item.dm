/datum/ai_planning_subtree/equip_item

/datum/ai_planning_subtree/equip_item/SelectBehaviors(datum/ai_controller/controller, seconds_per_tick)
	. = ..()
	var/atom/target = controller.blackboard[BB_MOB_EQUIP_TARGET]
	if(!target)
		return

	//Caustic Edit - The AI doesn't need to find weapons if it cannot use them!
	var/mob/living/living_pawn = controller.pawn
	if(HAS_TRAIT(living_pawn, TRAIT_CHUNKYFINGERS) || HAS_TRAIT(living_pawn, TRAIT_GNARLYDIGITS) || HAS_TRAIT(living_pawn, TRAIT_TINYPAWS))
		return
	//Caustic Edit End

	controller.queue_behavior(/datum/ai_behavior/equip_target, BB_MOB_EQUIP_TARGET)

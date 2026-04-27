
//desert areas

/area/rogue/outdoors/desert
	name = "Inner Dunes"
	icon_state = "desert"
	soundenv = 19
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	ambush_times = list("night")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/badger = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/raccoon = 25,
				/mob/living/simple_animal/hostile/retaliate/rogue/bobcat = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/fox = 30,
				/mob/living/carbon/human/species/skeleton/npc/supereasy = 30)
	first_time_text = "Al-Ashur Dunes"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	deathsight_message = "somewhere in the dunes, next to towering walls"
	warden_area = TRUE
	//threat_region = THREAT_REGION_DESERT_NEAR
	
/area/rogue/outdoors/desert/river
	name = "river"
	icon_state = "river"
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST

/area/rogue/outdoors/desertdeep
	name = "Deep Dunes"
	icon_state = "desertdeep"
	warden_area = TRUE
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	first_time_text = "Deep Dunes"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	ambush_times = list("night","dawn","dusk","day")	
	ambush_mobs = list(
		/mob/living/carbon/human/species/skeleton/npc/ambush = 30,
		/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 60,
		///mob/living/simple_animal/hostile/retaliate/rogue/spider/rock = 30,
		/mob/living/carbon/human/species/goblin/npc/ambush/cave = 50,
		/mob/living/simple_animal/hostile/retaliate/rogue/troll/bog = 15,
		/mob/living/carbon/human/species/skeleton/npc/bogguard = 10,
		///mob/living/carbon/human/species/skeleton/npc/rockhill = 15,
		/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 20,
		/mob/living/simple_animal/hostile/retaliate/rogue/wolf_undead = 10,)
	converted_type = /area/rogue/indoors/shelter/desertdeep
	deathsight_message = "an empty, parched desert"
	//threat_region = THREAT_REGION_DESERT_DEEP

/area/rogue/indoors/shelter/desertdeep
	name = "Deep Desert (shelter)"
	icon_state = "desertdeep"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'

/area/rogue/outdoors/desertdeep/safe
	name = "Desert Pass"
	ambush_times = null
	ambush_mobs = null

/area/rogue/outdoors/desertdeep/above
	name = "deep desert above"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	soundenv = 17
	first_time_text = null
	ambush_times = null
	ambush_mobs = null

/area/rogue/outdoors/desert/above
	name = "desert above"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	soundenv = 17
	first_time_text = null
	ambush_times = null
	ambush_mobs = null

//

/area/rogue/outdoors/town/desert
	name = "desert town outdoors"
	icon_state = "town"
	soundenv = 16
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	first_time_text = "The City of Al-Ashur"
	town_area = TRUE

/area/rogue/outdoors/town/roofs/desert
	name = "desert roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 17
	first_time_text = null


/area/rogue/indoors/shelter/town/desert
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'

/area/rogue/outdoors/town/manor/desert
	name = "Al-Ashur Palace exterior"
	icon_state = "manor"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/desert/Iberia2.ogg'
	first_time_text = "Al-Ashur Palace"
	keep_area = TRUE

/area/rogue/outdoors/town/manor/roofs/desert
	name = "Palace roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 17
	first_time_text = null
///

/area/rogue/indoors/town/desert
	name = "desert town indoors"
	icon_state = "town"
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	converted_type = /area/rogue/outdoors/exposed/town
	town_area = TRUE
	deathsight_message = "the city of Al-Ashur and all its bustling souls"

/area/rogue/indoors/town/desert/manor
	name = "Al-Ashur Palace interior"
	icon_state = "manor"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/desert/Iberia2.ogg'
	first_time_text = "Al-Ashur Palace"
	keep_area = TRUE

/area/rogue/indoors/town/desert/magician
	name = "Wizard's Tower"
	icon_state = "magician"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/magiciantower.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	keep_area = TRUE

/area/rogue/indoors/town/desert/shop
	name = "Shop"
	icon_state = "shop"
	droning_sound = 'sound/music/area/desert/Caravan.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/desert/smithguild
	name = "Guild Smithy"
	icon_state = "dwarfin"
	droning_sound = 'sound/music/area/desert/Sandal.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/desert/physician
	name = "Physician"
	icon_state = "physician"
	droning_sound = 'sound/music/area/academy.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/desert/academy
	name = "Academy"
	icon_state = "academy"
	droning_sound = 'sound/music/area/academy.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/desert/bath
	name = "Baths"
	icon_state = "bath"
	droning_sound = 'sound/music/area/desert/TenThousandDelights.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/desert/garrison
	name = "Al-Ashur Garrison"
	icon_state = "garrison"
	droning_sound = 'sound/music/area/desert/DarMeshq.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	keep_area = TRUE
	
/area/rogue/indoors/town/desert/garrison/cell
	name = "dungeon cell"
	icon_state = "cell"
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	keep_area = TRUE
	cell_area = TRUE

/area/rogue/indoors/town/desert/garrison/cell/outdoor
	name = "dungeon cell"
	icon_state = "cell"
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	keep_area = TRUE
	cell_area = TRUE


/area/rogue/indoors/town/desert/tavern
	name = "tavern"
	icon_state = "tavern"
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	droning_sound = 'sound/silence.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	tavern_area = TRUE

/area/rogue/indoors/town/desert/warden
	name = "Warden Fort"
	warden_area = TRUE

/area/rogue/outdoors/banditcamp/desert
	name = "Bandit Camp"
	droning_sound = 'sound/music/area/desert/stronghold.ogg'
	droning_sound_dusk = 'sound/music/area/desert/stronghold.ogg'
	droning_sound_night = 'sound/music/area/desert/stronghold.ogg'
	first_time_text = "A Gathering of Thieves"
	deathsight_message = "hidden among thieves, in the hoard of a dragon"

/area/rogue/indoors/banditcamp/desert
	name = "Bandit Camp"
	droning_sound = 'sound/music/area/desert/stronghold.ogg'
	droning_sound_dusk = 'sound/music/area/desert/stronghold.ogg'
	droning_sound_night = 'sound/music/area/desert/stronghold.ogg'
	deathsight_message = "hidden among thieves, in the hoard of a dragon"

/area/rogue/outdoors/town/desert
	name = "desert town outdoors"
	icon_state = "town"
	soundenv = 16
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	first_time_text = "The City of Al-Ashur"
	town_area = TRUE

/area/rogue/outdoors/town/roofs/desert
	name = "desert roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 17
	first_time_text = null
//////////////////////////////////////////////////////////////////

/area/rogue/indoors/shelter/town/desert
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'

/area/rogue/outdoors/town/manor/desert
	name = "Al-Ashur Palace exterior"
	icon_state = "manor"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/desert/Iberia2.ogg'
	first_time_text = "Al-Ashur Palace"
	keep_area = TRUE

/area/rogue/outdoors/town/manor/desert/roofs
	name = "Palace roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	soundenv = 17
	first_time_text = null
///

/area/rogue/indoors/town/desert
	name = "desert town indoors"
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	converted_type = /area/rogue/outdoors/exposed/town
	town_area = TRUE
	deathsight_message = "the city of Al-Ashur and all its bustling souls"

/area/rogue/indoors/town/manor/desert
	name = "Al-Ashur Palace interior"
	droning_sound = 'sound/music/area/desert/Iberia1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/desert/Iberia2.ogg'
	first_time_text = "Al-Ashur Palace"
	keep_area = TRUE

/area/rogue/indoors/town/magician/desert
	name = "Wizard's Tower"
	// spookysounds = SPOOKY_MYSTICAL
	// spookynight = SPOOKY_MYSTICAL
	// droning_sound = 'sound/music/area/magiciantower.ogg'
	// droning_sound_dusk = null
	// droning_sound_night = null
	// keep_area = TRUE

/area/rogue/indoors/town/shop/desert
	name = "Bazaar"
	droning_sound = 'sound/music/area/desert/Caravan.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/dwarfin/desert
	name = "Guild Smithy"
	droning_sound = 'sound/music/area/desert/Sandal.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/physician/desert
	name = "Physician"
	droning_sound = 'sound/music/area/academy.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/academy/desert
	name = "Academy"
	icon_state = "academy"
	droning_sound = 'sound/music/area/academy.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/bath/desert
	name = "Baths"
	droning_sound = 'sound/music/area/desert/TenThousandDelights.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/garrison/desert
	name = "Al-Ashur Garrison"
	droning_sound = 'sound/music/area/desert/DarMeshq.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	
/area/rogue/indoors/town/garrison/desert/cell
	name = "dungeon cell"
	icon_state = "cell"
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/indoors/town/garrison/desert/cell/outdoor
	name = "dungeon cell"
	icon_state = "cell"
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/desert/TheRoad.ogg'
	droning_sound_dusk = 'sound/music/area/desert/NightPrayer.ogg'
	droning_sound_night = 'sound/music/area/desert/Moonrise.ogg'
	ceiling_protected = FALSE
	keep_area = TRUE
	cell_area = TRUE

/area/rogue/indoors/town/tavern/desert
	name = "tavern"
	icon_state = "tavern"
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	droning_sound = 'sound/silence.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	tavern_area = TRUE

/area/rogue/indoors/town/desert/warden
	name = "Azeb Fort"
	warden_area = TRUE

/area/rogue/under/town/basement/desert
	name = "basement"
	town_area = FALSE
	ceiling_protected = TRUE

/area/rogue/under/town/basement/desert/town
	town_area = TRUE

/area/rogue/under/town/basement/desert/keep
	name = "palace basement"
	keep_area = TRUE
	town_area = TRUE

/area/rogue/indoors/town/desert/arenaview
	name = "Grand Arena"
	//viewing_area = TRUE

/area/rogue/indoors/town/church/cavebasement
	icon_state = "church"
	first_time_text = "THE CRYPT OF THE TEN"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/underdark2.ogg'

/area/rogue/indoors/town/church/psy
	name = "church"
	icon_state = "church"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	holy_area = TRUE
	droning_sound_dawn = 'sound/music/area/churchdawn.ogg'
	converted_type = /area/rogue/outdoors/exposed/church
	deathsight_message = "a hallowed place, sworn to the One"
	first_time_text = "THE HOUSE OF THE ONE"

/area/rogue/indoors/town/grove
	name = "grove"
	icon_state = "druidgrove"
	droning_sound = 'modular_deserttown/sounds/sound_music_area_druid.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	droning_sound_dawn = 'sound/music/area/forest.ogg'
	converted_type = /area/rogue/indoors/shelter/woods
	deathsight_message = "A sacred place of dendor, beneath the tree of Aeons.."
	warden_area = TRUE
	town_area = FALSE

/area/rogue/outdoors/town/grove
	icon_state = "druidgrove"
	color = "#b8b5c9"
	droning_sound = 'modular_deserttown/sounds/sound_music_area_druid.ogg'
	droning_sound_dawn = 'sound/music/area/forest.ogg'
	converted_type = /area/rogue/indoors/town/grove
	deathsight_message = "A sacred place of dendor, near the tree of Aeons.."
	first_time_text = null
	droning_sound_dusk = null
	droning_sound_night = null
	warden_area = TRUE
	town_area = FALSE

/area/rogue/under/cave/rhgoblinencampment
	name = "goblin encampment"
	icon_state = "under"
	first_time_text = "Lost Encampment"
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_BASEMENT
	droning_sound = 'modular_deserttown/sounds/sound_music_area_gobcamp.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ceiling_protected = TRUE
	deathsight_message = "A hidden goblin-stained fortress"

/area/rogue/under/underdark/rockhill
	name = "Central Underdark"
	first_time_text = "The Underdark"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	ambush_mobs = list(
		/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 20,
		/mob/living/simple_animal/hostile/retaliate/rogue/spider = 15,
		/mob/living/simple_animal/hostile/retaliate/rogue/mole = 15,
		/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 15,
		/mob/living/carbon/human/species/goblin/npc/ambush/moon = 40,
		/mob/living/simple_animal/hostile/retaliate/rogue/troll = 15)
	deathsight_message = "deep, dark and mushroom filled caverns"

/area/rogue/under/underdarker
	name = "Central Underdark" // Northern is Sunken City
	icon_state = "cavewet"
	warden_area = FALSE
	first_time_text = "The Underdark" // This is where most people will enter Underdark
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/underdark.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated = 20,
				/mob/living/carbon/human/species/elf/dark/drowraider/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/minotaur = 25,
				/mob/living/carbon/human/species/goblin/npc/ambush/moon = 30,
				/mob/living/simple_animal/hostile/retaliate/rogue/troll = 15,
				/mob/living/simple_animal/hostile/retaliate/rogue/drider = 10,
	)
	converted_type = /area/rogue/outdoors/caves
	deathsight_message = "an acid-scarred depths"
	detail_text = DETAIL_TEXT_UNDERDARK
//This version will use a different terraingen that spawns unhappy shrooms instead of happy shrooms, for scarier and eviler underdarks

////////////////////////
//INTERNAL VAR DEFINES//

//How many points does the nature subsystem have, and how much it can hold.
#define MAX_NATURE_POINTS 1000
#define MIN_NATURE_POINTS 0

//The Round Start value. By default this is -10.
#define ROUND_START_NATURE_HAPPINESS -10

//A scale between 100, and -100. When Nature is happy, it will grow happy plants. If nature is unhappy, it will grow evil plants. (More Maneaters, etc.)
//Dendorites can affect this happiness scale, growing sacred trees will please this scale. Anyone who destroys nature who are not dendorites will decrease happiness.
//This passively resets overtime back to 0 if the value is negative and enough time has passed without anyone harming nature.
#define MAX_NATURE_HAPPINESS 100
#define DEFAULT_NATURE_HAPPINESS 0 //Do not change these values without viewing how they are used in the probabilities and happiness proc.
#define MIN_NATURE_HAPPINESS -100

//Different thresholds for nature. Serene is the best/goodest, Wretched is the worst/not goodest and angry and evil and we hate everything...
#define SERENE_NATURE_THRESHOLD		75
#define JUBILANT_NATURE_THRESHOLD	50
#define HAPPY_NATURE_THRESHOLD 		25
#define SAD_NATURE_THRESHOLD  	   -25
#define MISERABLE_NATURE_THRESHOLD -50
#define WRETCHED_NATURE_THRESHOLD  -75

//The amount of happiness we will rest at if we are below 25 and have fully decayed off sadness.
#define RESTING_LIMIT_NATURE_HAPPINESS 25

//The rate at which we decay negative happiness values.
//With a decay divisor of 1.25, and a negative happiness of 100, we decay 20 happiness, resulting at -80 happiness.
#define SADNESS_DECAY_DIVISOR 1.25

//Applied when flora objects are destroyed. Remember;
	// LOTS of people can destroy shit at once and there's a fuck ton of plants everywhere. Make people WORK FOR IT if they wanna upset nature. Even just a single person!
#define NATURE_HAPPINESS_ADJUSTMENT_VERY_LOW 0.025 //For things like trees that have many possible layers.
#define NATURE_HAPPINESS_ADJUSTMENT_LOW  0.05
#define NATURE_HAPPINESS_ADJUSTMENT_MID  0.1
#define NATURE_HAPPINESS_ADJUSTMENT_HIGH 0.25

//The value used when calculating point growth. The more plants that exist, the less points that are gained.
	//point gain = (MAX_PLANT_POPULATION / `how_many_plants_exst`) * GROWTH_DIVISOR
	//If we have 7588 plants alive, we end up with 32 points.
	//If we have 1552 plants alive, we end up with 161 points.
#define GROWTH_DIVISOR 25

//How many plants on turfs are allowed to exist at once. If `how_many_plants_exist` exceeds this value, the subsystem does not spawn any more.
#define MAX_PLANT_POPULATION 100000

//How many objects on branches are allowed to exist at once. If `how_many_objects_exist` exceeds this value, the subsystem does not spawn any more.
#define MAX_BRANCH_OBJECTS 1000

//Cost in points for growing a new plant. By default, this is 1 point.
#define NORMAL_NATURE_COST 1

//Point multiplier for when Dendor, Astrata, or Abyssor are the storyteller. Plants are 60% cheaper, let the world bloom!
#define GOOD_NATURE_COST 1.6

//Point multiplier for when Zizo or Pestra are the storyteller. Plants are 60% more expensive. Let the world suffer...
#define BAD_NATURE_COST 0.4

//Gods that increase growth towards plants. Less point costs.
#define GOOD_PLANT_GODS list(/datum/patron/divine/dendor, /datum/patron/divine/astrata, /datum/patron/divine/abyssor)

//Gods that reduce growth to planhts. More point costs.
#define BAD_PLANT_GODS list(/datum/patron/inhumen/zizo, /datum/patron/divine/pestra)

//The turfs allowed to be grown on, this includes primarily and only grass tiles, other turfs may be applied.
#define ALLOWED_TURFS list(/turf/open/floor/rogue/grass)

/////////////////////////////////
// OBJECTS AND WEIGHTS DEFINES //


//The plants that are capable of being chosen to spawn in the world, associated by weight. More weight makes them more common.
#define PLANT_OBJECTS list(/obj/structure/flora/roguegrass = 50, /obj/structure/flora/roguegrass/bush = 50)

//The plants that are capable of being chose to spawn in the world, associated by weight. This is an evil variant of plants however.
#define EVIL_PLANT_OBJECTS list(/obj/structure/zizo_bane = 3, \
	/obj/structure/flora/roguegrass/maneater = 1)

//The objects that can spawn on trees in the world, associated by weight.
#define BRANCH_OBJECTS list(/obj/item/reagent_containers/food/snacks/crow = 19, /obj/structure/fluff/nest = 1)

//The objects that can spawn on trees only when nature is unhappy, associated by weight.
#define EVIL_BRANCH_OBJECTS list(/obj/item/reagent_containers/food/snacks/crow = 20)

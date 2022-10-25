/// @description  Variables and Initialisation

alarm_set(0, 60)
display_reset(0,true)
image_speed = 0
depth = 0

hsp = 0 // Horizontal Speed
vsp = 0 // Vertical Speed

movespeed = 2.5 // Movement Speed (for both directions)
asp = 0.2 // Animation Speed


/// Globals ///
// Currencies
global.gold = 0				// Main Currency
global.techfrags = 0		// Tech Fragments from Ruins
global.supplies = 0			// Supplies for the Peacemakers
global.contraband = 0		// Contraband for the Syndicate

// Misc
global.immobile = false // Determines whether or not the player can move
global.persona[0] = "John Duqarte" // The Player's Name
global.persona[1] = "Male"		   // Player's Sex
global.persona[2] = "Mr"		   // Sexed title #1
global.persona[3] = "Sir"		   // Sexed title #2
global.persona[4] = "Lord"		   // Sexed title #3
global.persona[5] = "He"		   // Pronoun #1
global.persona[6] = "Him"		   // Pronoun #2
global.persona[7] = "His"		   // Pronoun #3

// Attributes
global.hp = 70			// Player Health
global.max_hp = 100		// Player Max Health
global.mp = 100			// Player Mana
global.max_mp = 100		// Player Max Mana
global.sp = 100			// Player Stamina
global.max_sp = 100		// Player Max Stamina

// General
global.class = "warrior"	// Player Class
global.level = 1			// Player Level
global.exp = 0				// Player Current EXP
global.exp_req = 1000		// Player EXP needed for next level

// Combat Stats
global.atk = 5		// Attack (current damage per physical hit)
global.def = 5		// Defense (armour rating + buffs, determines how much damage is ignored when physically attacked)
global.stk = 5		// Special Attack (current damage per special hit)
global.sdf = 5		// Special Defense (determines how much damage is ignored when non-physically attacked)
global.mtk = 5		// Magic Attack (current damage per magical hit)
global.mdf = 5		// Magic Defense (determines how much damage is ignored when magically attacked)

// Main Attributes
global.spd = 5		// Speed - affects attack/movement speed
global.edr = 5		// Endurance - affects max health
global.dex = 5		// Dexterity - affects max stamina
global.int = 5		// Inteligence - affects max mana
global.luk = 5		// Luck - affects crit chance

// Skills
// Craft Skills
global.smithing = 5		// Acts as a requirement to use higher tiers of Recipe Books
global.alchemy = 5		// Acts as a requirement to use higher tiers of Recipe Books
global.enchanting = 5	// Acts as a requirement to use higher tiers of Recipe Books + Increases power of enchantments

// Weapon Skills
global.blade = 5		// Increases hit chance + damage of bladed weapons
global.archery = 5		// Increases hit chance + damage of bows/crossbows
global.staves = 5		// Increases hit chance + damage of staves

// Misc Skills
global.barter = 5		// Increases sale price + decreases buy price
global.locks = 5		// Allows you to pick different tiers of locks (4 - Basic, 8 - Standard, 16 - Complex, 22 - Master)
global.archaeology = 5	// Allows you to decipher different tiers of Founder Writings (5 - Beginner, 10 - Average, 20 - Fluent, 30 - Loremaster)




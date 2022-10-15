/// @description  Variables and Initialisation

display_reset(0,true)
image_speed = 0
depth = 0

hsp = 0 // Horizontal Speed
vsp = 0 // Vertical Speed

movespeed = 2.5 // Movement Speed (for both directions)
asp = 0.2 // Animation Speed


/// Globals ///
// Currencies
global.gold = 0		// Main Currency

// Attributes
global.hp = 60			// Player Health
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
global.atk = 5		// Attack
global.def = 5		// Defense
global.stk = 5		// Special Attack
global.sdf = 5		// Special Defense
global.mtk = 5		// Magic Attack
global.mdf = 5		// Magic Defense

global.spd = 5		// Speed - affects attack/movement speed
global.edr = 5		// Endurance - affects max health
global.dex = 5		// Dexterity - affects max stamina
global.int = 5		// Inteligence - affects max mana

// Skills
global.smithing = 5
global.alchemy = 5
global.enchanting = 5

global.blade = 5
global.archery = 5
global.staves = 5

global.barter = 5
global.locks = 5
global.persuasion = 5
global.tech = 5
global.archaeology = 5

global.immobile = false // Determines whether or not the player can move


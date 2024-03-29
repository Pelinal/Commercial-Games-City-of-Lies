/// @description  Variables and Initialisation

display_reset(0, true)
image_speed = 0
depth = 0

intro_text = false

// Sprites used for animations
lr_sprite = noone
up_sprite = noone
dn_sprite = noone

// Sprites used for attacks
co_sprite = noone
ca_sprite = noone

hsp = 0 // Horizontal Speed
vsp = 0 // Vertical Speed

base_speed = 3
movespeed = 0.833333333 // Movement Speed (for both directions)
asp = 0.2 // Animation Speed

prev_battle = noone

/// Globals ///
// Currencies
global.gold = 0				// Main Currency
global.frags = 0			// Tech Fragments from Ruins
global.supplies = 0			// Supplies for the Peacemakers
global.contraband = 0		// Contraband for the Syndicate

// Misc
global.immobile = false // Determines whether or not the player can move
global.persona[0] = "John Duqarte" // Name
global.persona[1] = "Male"		   // Gender
global.persona[2] = "Mr"		   // Title #1
global.persona[3] = "sir"		   // Title #2
global.persona[4] = "lord"		   // Title #3
global.persona[5] = "he"		   // Pronoun #1
global.persona[6] = "him"		   // Pronoun #2
global.persona[7] = "his"		   // Pronoun #3
global.persona[8] = "son"		   // Pronoun #4

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
global.base_atk = 5
global.base_def = 5
global.base_stk = 5
global.base_sdf = 5
global.base_mtk = 5
global.base_mdf = 5

global.atk = 5		// Attack (current damage per physical hit)
global.def = 5		// Defense (armour rating + buffs, determines how much damage is ignored when physically attacked)
global.stk = 5		// Special Attack (current damage per special hit)
global.sdf = 5		// Special Defense (determines how much damage is ignored when non-physically attacked)
global.mtk = 5		// Magic Attack (current damage per magical hit)
global.mdf = 5		// Magic Defense (determines how much damage is ignored when magically attacked)

global.mtk_type = noone // Determines damage type of magical damage

// Main Attributes
global.spd = 10		// Speed - affects attack/movement speed
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
global.blade = 1		// Increases hit chance + damage of bladed weapons
global.archery = 1		// Increases hit chance + damage of bows/crossbows
global.staves = 1		// Increases hit chance + damage of staves

// Misc Skills
global.barter = 3		// Increases sale price + decreases buy price
global.locks = 2		// Allows you to pick different tiers of locks (4 - Basic, 8 - Standard, 16 - Complex, 22 - Master)
global.archaeology = 1	// Allows you to decipher different tiers of Founder Writings (5 - Beginner, 10 - Average, 20 - Fluent, 30 - Loremaster)
global.charisma = 2		// Allows you to persaude/intimidate people in dialogue (5 - Pragmatic, 10 - Stubborn, 15 - Resolute, 22 - Unwavering, 30 - Ignorant)
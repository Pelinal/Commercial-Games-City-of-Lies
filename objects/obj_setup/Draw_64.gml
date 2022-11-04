/// @description GUI

draw_set_colour(c_white)
draw_set_alpha(1)

draw_set_font(fnt_questlog_large)
draw_set_halign(fa_center)

if phase == 1 {
	draw_self()
	draw_text(960, 48, "Choose Class")
	
	if panel_overview != -1 {
		if global.persona[1] == "Male" { draw_sprite(spr_male, panel_overview, 960, 512) }
		else if global.persona[1] == "Female" { draw_sprite(spr_female, panel_overview, 960, 512) }
	} else {
		if global.persona[1] == "Male" { draw_sprite(spr_male, 0, 960, 512) }
		else if global.persona[1] == "Female" { draw_sprite(spr_female, 0, 960, 512) }
	}
	
	// Draw Body Text
	if panel == "Class" {
		draw_set_font(fnt_questlog_medium)
		draw_text(x, 192, "Warrior")
		draw_tile(ts_icons_iconset_128, 164, 0, x-64, 256)
		draw_text(x, 429, "Rogue")
		draw_tile(ts_icons_iconset_128, 163, 0, x-64, 493)
		draw_text(x, 666, "Mage")
		draw_tile(ts_icons_iconset_128, 165, 0, x-64, 730)
	} else if panel == "ClassDesc" && panel_overview != -1 {
		switch panel_overview {
			case 2: // Warrior
				draw_set_font(fnt_questlog_medium)
				draw_text(x, 192, "Warrior")
				draw_set_font(fnt_inventory_small)
				draw_set_halign(fa_left)
				draw_text(x - 272, 256, "Warriors are slow-moving juggernauts that\n"+
									  "deal high damage. Their primary attribute\n"+
									  "is Endurance and they excel in Defense.")
				draw_text(x - 272, 440, "Weapons: Swords, Axes")
				draw_text(x - 272, 504, "Armour: Heavy")
				draw_text(x - 272, 568, "Strengths: Endurance, Defense, Attack")
				draw_text(x - 272, 632, "Weaknesses: Intelligence, Speed, Sp. Def")
				break;
			case 1: // Rogue
				draw_set_font(fnt_questlog_medium)
				draw_text(x, 192, "Rogue")
				draw_set_font(fnt_inventory_small)
				draw_set_halign(fa_left)
				draw_text(x - 272, 256, "Rogues are fast-moving and lightweight,\n" +
									  "they deal high damage and have highter crit\n" + 
									  "chance. Their primary attribute is Dexterity\n" +
									  "and they excel in Special Attack.")
				draw_text(x - 272, 440, "Weapons: Daggers, Bows")
				draw_text(x - 272, 504, "Armour: Medium")
				draw_text(x - 272, 568, "Strengths: Dexterity, Speed, Sp. Atk")
				draw_text(x - 272, 632, "Weaknesses: Endurance, Attack, M. Def")
				break;
			case 0: // Mage
				draw_set_font(fnt_questlog_medium)
				draw_text(x, 192, "Mage")
				draw_set_font(fnt_inventory_small)
				draw_set_halign(fa_left)
				draw_text(x - 272, 256, "Mages are wielders of arcane power through\n" +
										"their use of Solite. They deal unqiue magic\n" + 
										"damage, have low crit chance, and their main\n" +
										"attriubute is Intelligence.")
				draw_text(x - 272, 440, "Weapon: Staff")
				draw_text(x - 272, 504, "Armour: Light")
				draw_text(x - 272, 568, "Strengths: Intelligence, M. Atk, M. Def")
				draw_text(x - 272, 632, "Weaknesses: Dexterity, Defense, Sp. Atk")
				break;
		}
	}
	draw_set_halign(fa_left)
} else if phase == 0 {
	draw_text(960, 64, "Choose Character")
} else if phase == 2 {
	draw_text(960, 64, "Type Name")
	draw_rectangle(832, 536, 1088, 544, false)
	draw_set_font(fnt_inventory_small)
	draw_set_halign(fa_center)
	draw_text(960, 496, global.persona[0])
	draw_set_halign(fa_left)
}


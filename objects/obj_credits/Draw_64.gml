/// @description Insert description here
// You can write your code in this editor

draw_self()

// Title
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_set_font(fnt_inventory_large)
draw_text(x, y - 423, "Credits: City of Lies")

// Body
draw_set_halign(fa_left)
draw_set_font(fnt_questlog_small)
var text = string_wordwrap_width("Tilesets & SFX: RPG MAKER XP, RTP by KADOKAWA. Non-Rm license.\n\nSprites: LPC, OpenGameArt.org. CC-BY-SA 3.0. [See 'Sprite Credit.txt' for full credits]\n\nUI: CC-BY 3.0: CharlesGabriel 'Basic Message Boxes' OpenGameArt.org\n\nIcons: CC-BY 3.0: Avery 'Avy's Icon Workshop' Forums.Rpgmakerweb.com\n\nLighting: 'Lighting System 2D' by Jobo. GameMaker Marketplace.\n\nMusic:\n\n - CC0: RandomMind 'The Bard's Tale' OpenGameArt.org\n - CC-BY-SA 4.0: FantasyMusica 'Castle01' OpenGameArt.org\n	Rest by Aaron Krogh Music under C00 free for commerical use.", 758, "\n")
draw_text(x - 391, y - 216, text)
draw_set_halign(fa_left)
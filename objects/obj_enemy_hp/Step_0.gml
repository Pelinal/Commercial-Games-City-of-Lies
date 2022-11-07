/// @description Determine Index

if id_list[1] == noone && id_list[2] == noone && id_list[3] == noone {
	// One Enemy
	image_index = 3
} else if id_list[1] != noone && id_list[2] == noone && id_list[3] == noone {
	// Two Enemies
	image_index = 2
} else if id_list[1] != noone && id_list[2] != noone && id_list[3] == noone {
	// Three Enemies
	image_index = 1
} else if id_list[1] != noone && id_list[2] != noone && id_list[3] != noone {
	// Four Enemies
	image_index = 0
}
/// @description Determine Index

if array_length(id_list) == 1 {
	// One Enemy
	image_index = 3
} else if array_length(id_list) == 2 {
	// Two Enemies
	image_index = 2
} else if array_length(id_list) == 3 {
	// Three Enemies
	image_index = 1
} else if array_length(id_list) == 4 {
	// Four Enemies
	image_index = 0
}
extends Control

@export var scene_to_load: PackedScene


func _on_levels_pressed():
	get_tree().change_scene_to_packed(scene_to_load)


func _on_quit_pressed():
	# Quit the game
	get_tree().quit()

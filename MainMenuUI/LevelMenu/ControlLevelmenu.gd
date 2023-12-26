extends Control

@export var tutorial_level: PackedScene
@export var level_one: PackedScene


#tutorial level
func _on_tutorial_pressed():
	get_tree().change_scene_to_packed(tutorial_level)

#level one scene
func _on_level_1_pressed():
	get_tree().change_scene_to_packed(level_one)


#back to menu button
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")


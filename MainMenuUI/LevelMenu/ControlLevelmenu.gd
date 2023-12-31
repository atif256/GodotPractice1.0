extends Control

@export var tutorial_level: PackedScene
@export var level_one: PackedScene
@export var level_two: PackedScene


#tutorial level


#level one scene



#back to menu button
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")




#new design
func _on_tutorial_pressed():
	get_tree().change_scene_to_packed(tutorial_level)

func _on_level_1_pressed():
	get_tree().change_scene_to_packed(level_one)

func _on_level_2_pressed():
	get_tree().change_scene_to_packed(level_two)


#new back button design
func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")

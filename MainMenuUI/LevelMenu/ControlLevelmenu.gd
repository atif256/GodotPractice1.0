extends Control

@export var tutorial_level: PackedScene
@export var level_one: PackedScene
@export var level_two: PackedScene
@export var level_three: PackedScene
var level0: bool = true
var level1: bool = false
var level2: bool = false
var level3: bool = false
var level4: bool = false
var level5: bool = false


#back to menu button
func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")

#this is level0
func _on_tutorial_pressed():
	get_tree().change_scene_to_packed(tutorial_level)

#this is level1
func _on_level_1_pressed(): 
	get_tree().change_scene_to_packed(level_one)
	
#this is level2
func _on_level_2_pressed():
	get_tree().change_scene_to_packed(level_two)

func _on_level_3_pressed():
	get_tree().change_scene_to_packed(level_three)


#new back button design
func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")



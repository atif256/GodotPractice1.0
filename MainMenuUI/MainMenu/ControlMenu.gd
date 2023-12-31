extends Control

#to level scene
func _on_levels_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/LevelMenu/levels_menu.tscn")



#to options scene
func _on_button_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/OptionMenu/options_menu.tscn")



#new design button
#to level scene
func _on_play_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/LevelMenu/levels_menu.tscn")

#to options scene
func _on_options_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/OptionMenu/options_menu.tscn")

#to quit the game
func _on_quit_pressed():
	get_tree().quit()

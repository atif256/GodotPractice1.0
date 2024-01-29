extends Control


#new design button
#to level scene
func _on_play_pressed():
	$MainMenuElements/ButtonClick.play()
	await $MainMenuElements/ButtonClick.finished
	get_tree().change_scene_to_file("res://MainMenuUI/LevelMenu/levels_menu.tscn")

#to options scene
func _on_options_pressed():
	$MainMenuElements/ButtonClick.play()
	await $MainMenuElements/ButtonClick.finished
	get_tree().change_scene_to_file("res://MainMenuUI/OptionMenu/options_menu.tscn")

#to quit the game
func _on_quit_pressed():
	$MainMenuElements/ButtonClick.play()
	await $MainMenuElements/ButtonClick.finished
	get_tree().quit()

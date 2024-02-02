extends Panel

func _on_main_menu_button_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")


func _on_next_button_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://MainMenuUI/OptionMenu/options_menu_2.tscn")

extends Control


func _on_main_menu_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")


func _on_restart_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().reload_current_scene()

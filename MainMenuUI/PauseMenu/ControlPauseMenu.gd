extends Control

@onready var main = $"../../"

func _ready():
	#hide()
	pass


func _on_resume_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	main.pauseMenu()


func _on_restart_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().reload_current_scene()


func _on_option_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	print(" go to option menu")

func _on_main_menu_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")








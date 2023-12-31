extends Control

@onready var main = $"../../"
#@onready var yesno_menu = $"../YesOrNo"


func _ready():
	#hide()
	pass


func _on_resume_pressed():
#	get_tree().set_pause(false)
#	hide()
	main.pauseMenu()


func _on_save_pressed():
	print("saving")


func _on_option_pressed():
	print(" go to option menu")
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")





extends Control


func _ready():
	pass

func _on_yes_pressed():
	print("go to main menu")
	#hide() # go to main menu
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")

func _on_no_pressed():
	hide()

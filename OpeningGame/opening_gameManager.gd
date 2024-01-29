extends Control

@onready var opening_animation: String = "opening"

func _on_animation_player_animation_finished(anim_name):
	if anim_name == opening_animation:
		get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")

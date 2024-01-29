extends Control



#to restart the current scene
func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")



#to change scene
func _on_next_pressed():
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

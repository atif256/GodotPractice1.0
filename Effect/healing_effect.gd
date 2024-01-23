extends Node2D

@export var healing_animation: String = "healing"

func _on_animation_player_animation_finished(anim_name):
	if (anim_name == healing_animation):
		queue_free()

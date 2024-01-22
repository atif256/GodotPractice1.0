extends Node2D


func _ready():
	%AnimationPlayer.play("sparkling")
	await %AnimationPlayer.animation_finished
	queue_free()

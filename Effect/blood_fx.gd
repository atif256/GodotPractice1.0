extends Node2D


func _ready():
	%AnimationPlayer.play("blood")
	await %AnimationPlayer.animation_finished
	queue_free()



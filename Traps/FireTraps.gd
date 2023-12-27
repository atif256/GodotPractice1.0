extends Area2D

var damage: int = 20
@onready var animation_tree: AnimationTree = $AnimationTree

func _ready():
	animation_tree.active = true


func _on_player_detector_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			child.hit(damage,Vector2.ZERO)

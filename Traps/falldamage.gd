extends Area2D

@export var damage: int = 101


func _on_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			child.hit(damage,Vector2.ZERO)

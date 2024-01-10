extends Area2D 


@export var damage : int =20 #10 initial

func _ready():
	pass


func _on_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
				child.hit(damage, Vector2.ZERO)


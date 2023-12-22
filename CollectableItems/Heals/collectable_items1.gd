extends Area2D

@export var heal: int = 30
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(_delta):
	pass
#	if not is_on_floor():
#		velocity.y += gravity * delta

func _on_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			child.heal(heal)
			queue_free()

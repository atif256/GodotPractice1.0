extends State


#@export var knockback_speed: float = 100
#var knockback_direction: Vector2
#var velocity: Vector2 = Vector2.ZERO
#@onready var raycast2: RayCast2D = $"../../DetectorToClose"
#@export var flip_state: State
#
#func _ready():
#
#	jump_behind()
#
#
#
#func jump_behind():
#	if raycast2.is_colliding():
#		emit_signal("interrupt_state", flip_state)
#		print("jump to the back")
#		character.velocity = knockback_speed * knockback_direction

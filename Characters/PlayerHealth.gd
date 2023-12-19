extends Node

class_name PlayerHealth

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )
#snail health
@export var health: float = 100:
	get:
		return health
	set(value):
		#SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

@export var dead_animation_name: String = "dead"

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	#print_debug(health)
	emit_signal("on_hit", get_parent(), damage, knockback_direction)

extends Node

class_name DamageableBee

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )
#snail health
@export var health: float = 50:
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

@export var dead_animation_name: String = "hit"

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	#print_debug(health)
	emit_signal("on_hit", get_parent(), damage, knockback_direction)

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dead_animation_name):
		get_parent().queue_free()

extends Node

class_name PlayerHealth #node from player

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )
#snail health
@export var health: float = 100: #100
	#setget set_health
	get:
		return health
	set(value):
		#SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value
		#emit_signal("on_hit", self, damage_taken, knockback_direction)
	

@export var dead_animation_name: String = "dead"

#func set_health(value):
#	health = value
#	if health <= 0:
#		emit_signal("on_hit", self, damage_taken, knockback_direction)

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	#print_debug(health)
	emit_signal("on_hit", get_parent(), damage, knockback_direction)



func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == dead_animation_name):
		get_parent().queue_free()

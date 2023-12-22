extends Node

class_name PlayerHealth #node from player

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )

signal on_heal(node: Node, heal_taken: int)
#snail health
@export var health: float = 100: #100
	#setget set_health
	get:
		return health
	set(value):
		health = value

@export var dead_animation_name: String = "dead"

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	#print_debug(health)
	emit_signal("on_hit", get_parent(), damage, knockback_direction)

#to pick up the heal item
func heal(heal: int):
	health += heal
	emit_signal("on_heal", get_parent(), heal)

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == dead_animation_name):
		get_parent().queue_free()

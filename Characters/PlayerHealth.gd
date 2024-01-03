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
		#health = value
		health = clamp(value, 0, max_health)
		update_health_bar()

@export var max_health: float = 100
@export var dead_animation_name: String = "dead"
var health_bar: TextureProgressBar = null

func _ready():
	health_bar = $"../PHealthBar" #here is the reference problem
	# new added
	update_health_bar()


func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	update_health_bar()

#to pick up the heal item
func heal(heal: int):
	health += heal
	emit_signal("on_heal", get_parent(), heal)
	if health > 100:
		health = 100
	
	update_health_bar()

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == dead_animation_name):
		get_parent().queue_free()

func update_health_bar():
	if health_bar:
		health_bar.value = health

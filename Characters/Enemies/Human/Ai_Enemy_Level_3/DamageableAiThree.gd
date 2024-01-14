extends Node

class_name DamageableAiThree

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )
#snail health
@export var health: float = 20:
	get:
		return health
	set(value):
		health = clamp(value, 0, max_health)  # Ensure health stays within valid range
		update_health_bar()

@export var max_health: float = 20
@export var dead_animation_name: String = "dead"
var health_bar: TextureProgressBar = null

func _ready():
	health_bar = $"../HealthBar"
	update_health_bar()
	

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	update_health_bar()


func update_health_bar():
	if health_bar:
		health_bar.value = health

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == dead_animation_name):
		get_parent().queue_free()

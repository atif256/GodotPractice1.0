extends Node

class_name DamageableBoar
signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2)

@export var health: float = 40:
	get:
		return health
	set(value):
		health = clamp(value, 0, max_health)  # Ensure health stays within valid range
		update_health_bar()

@export var max_health: float = 40  # Set the maximum health value

@export var dead_animation_name: String = "dead"

# Reference to the ProgressBar node
var health_bar: ProgressBar = null
var thealth_bar: TextureProgressBar = null

func _ready():
	health_bar = $"../HealthBar" 
	thealth_bar = $"../THealthbarBar"
	update_health_bar()

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)

#	if health <= 0:
#		health = 0  # Ensure health does not go below 0
#		get_parent().queue_free()

	update_health_bar()

func update_health_bar():
	if health_bar:
		health_bar.value = health
	if thealth_bar:
		thealth_bar.value = health
		


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dead_animation_name):
		get_parent().queue_free()

extends Node

class_name DamageableBoarWhite
signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2)

@export var health: float = 40: #40
	get:
		return health
	set(value):
		health = clamp(value, 0, max_health)
		update_health_bar()

@export var max_health: float = 40 #40

@export var dead_animation_name: String = "dead"
var thealth_bar: TextureProgressBar = null

func _ready():
	thealth_bar = $"../THealthbarBar"
	update_health_bar()

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	print_debug(health)
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	update_health_bar()

func update_health_bar():
	if thealth_bar:
		thealth_bar.value = health

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == dead_animation_name):
		get_parent().queue_free()

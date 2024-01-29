extends Node

class_name DamageableBee

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )
#snail health
@export var health: float = 20:
	get:
		return health
	set(value):
#		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = clamp(value, 0, max_health)
		update_health_bar()

@export var max_health: float = 20
@export var dead_animation_name: String = "hit"

var thealth_bar: TextureProgressBar = null

func _ready():
	thealth_bar = $"../THealthbarBar"
	update_health_bar()

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	update_health_bar()

func update_health_bar():
	if thealth_bar:
		thealth_bar.value = health

extends Area2D

class_name FireBreather

var damage: int = 200
@onready var animation_tree: AnimationTree = $AnimationTree

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )

@export var health: float = 20:
	get:
		return health
	set(value):
		health = clamp(value, 0, max_health)
		update_health_bar()

@export var max_health: float = 20
var health_bar: TextureProgressBar = null

func _ready():
	animation_tree.active = true
	health_bar = $"../HealthBar"
	update_health_bar()
	health_bar.visible = false

func _on_player_detector_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			child.hit(damage,Vector2.ZERO)

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	print_debug(health)
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	if health < 20:
		health_bar.visible =true
	if health <= 0:
		health = 0  # Ensure health does not go below 0
		get_parent().queue_free()
	update_health_bar()

func update_health_bar():
	if health_bar:
		health_bar.value = health


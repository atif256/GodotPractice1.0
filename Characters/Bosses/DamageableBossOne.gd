extends Node

class_name BossOne

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )
signal health_changed(health: float)

@export var health: float = 150:
	get:
		return health
	set(value):
		health = value
		update_health_bar()

@export var dead_animation_name: String = "dead"
var health_bar: TextureProgressBar = null
var name_label: Label = null

func _ready():
	health_bar = get_node("../../HealthBarBossOne/HpBossOne")
	name_label = get_node("../../HealthBarBossOne/BossOneName")
	health_bar.visible = false
	name_label.visible = false
#	name_label.visible = true
	update_health_bar()

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	print_debug(health)
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	update_health_bar()


func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == dead_animation_name):
		get_parent().queue_free()
		health_bar.visible = false
		name_label.visible = false

func update_health_bar():
	if health_bar:
		health_bar.value = health
		emit_signal("health_changed", health)

func _on_healthbar_visible_on_body_entered(body):
	print("body enter")
	health_bar.visible = true
	name_label.visible = true

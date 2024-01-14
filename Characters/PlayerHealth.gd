extends Node

class_name PlayerHealth #node from player
@onready var player = $".."
# handle coins collect
var score: int = 0
signal on_score(node: Node, score_taken: int)
#new signal
signal health_changed(health: float)
signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2 )
signal on_heal(node: Node, heal_taken: int)
#signal on_fall(node: Node, fall_taken: int)


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
var score_bar: ProgressBar = null

func _ready():
	print_debug("score = ", score)
#	health_bar = get_node("/root/TestLevel/PlayerHealthBarUI/PHealthBar")
	health_bar = get_node("../../PlayerHealthBarUI/PHealthBar")
	# new added
	score_bar = get_node("../../PlayerHealthBarUI/Coinoftherealm")
	
	update_health_bar()
	update_score_bar()

func hit(damage: int, knockback_direction: Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	update_health_bar()

#to pick up the heal item
func heal(heals):
	health += heals
	emit_signal("on_heal", get_parent(), heals)
	if health > 100:
		health = 100
	update_health_bar()

#func fall(fall_damage):
#	health -= fall_damage
#	print_debug(health)
#	emit_signal("on_fall", get_parent(), fall_damage)
#	update_health_bar()

func coin(coins):
	score += coins
	print_debug("score = ", score)
	emit_signal("on_score", get_parent, coins)
	$"../AudioStreamPlayer2D".play()
	update_score_bar()

func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == dead_animation_name):
		get_parent().queue_free()
		player.position = Vector2.ZERO

func update_health_bar():
	if health_bar:
		health_bar.value = health
		emit_signal("health_changed", health)

func update_score_bar():
	if score_bar:
		score_bar.value = score


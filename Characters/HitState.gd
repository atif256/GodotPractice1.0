extends State

class_name HitState

@export var damageable: Damageable
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export var knockback_speed: float = 100
@export var return_state: State

@onready var timer: Timer = $Timer

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	
func on_enter():
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction: Vector2):
	if(damageable.health > 0): #>=
		character.velocity = knockback_speed  *  knockback_direction
		emit_signal("interrupt_state", self)
		call_deferred("health_floating")
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		call_deferred("drop")
		call_deferred("health_floating")

func on_exit():
	character.velocity = Vector2.ZERO

func _on_timer_timeout():
	next_state = return_state

func drop():
	const coin = preload("res://CollectableItems/Coins/coins_collectable.tscn")
	var coin_drop = coin.instantiate()
	get_tree().get_root().add_child(coin_drop)
	coin_drop.global_position = $"../..".global_position

func health_floating():
	const floating = preload("res://UI/health_floating_indicator.tscn")
	var health_floating_node = floating.instantiate()
	get_tree().get_root().add_child(health_floating_node)
	health_floating_node.global_position = $"../..".global_position

extends State

class_name HitStateAiThree

@export var damageable: DamageableAiThree
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export var hit_animation: String = "hit"
@export var idle_animation: String = "idle"
@onready var timer: Timer = $Timer
@export var return_state: State

func _ready():
	damageable.connect("on_hit", on_damageable_hit)


func on_enter():
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2):
	if (damageable.health > 0 ):
		emit_signal("interrupt_state", self)
		playback.travel(hit_animation)
		call_deferred("health_floating")
	#else:
	elif (damageable.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		call_deferred("drop")
		call_deferred("health_floating")

func _on_timer_timeout():
	if damageable.health > 0:
		next_state = return_state
		playback.travel(idle_animation)

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

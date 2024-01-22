extends State

class_name HitStateAiOne

@export var damageable: DamageableAiOne
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export	var return_state: State
@export	var current_state: State
@export var attack_state: State
@export var run_animation_name: String = "run"
@export var magic_animation: String = "magic"
@export var attack_animation_name: String = "attack"
@export var hit_animation: String = "hit"
@export var knockback_speed: float = 100
@onready var timer: Timer = $Timer


func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2):
	if (damageable.health > 0 ):
		emit_signal("interrupt_state", self)
		playback.travel(hit_animation)
		$"../../hurtSFX".play()
	#else:
	elif (damageable.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		call_deferred("drop")


func _on_timer_timeout():
#	timer.stop() #0.6
	next_state = return_state
	playback.travel(run_animation_name)
	if damageable.health == 20:
		emit_signal("interrupt_state", attack_state)
		playback.travel(magic_animation)
		



func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == magic_animation):
		emit_signal("interrupt_state", return_state)
		playback.travel(run_animation_name)

func drop():
	const coin = preload("res://CollectableItems/Coins/coins_collectable.tscn")
	var coin_drop = coin.instantiate()
	get_tree().get_root().add_child(coin_drop)
	coin_drop.global_position = $"../..".global_position

extends State

class_name HitStateAiOne

@export var damageable: DamageableAiOne
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export	var return_state: State
@export	var current_state: State
@export var run_animation_name: String = "run"
@export var idle_animation_name: String = "idle"
@export var attack_animation_name: String = "attack"
@export var knockback_speed: float = 100
@onready var timer: Timer = $Timer

var is_hit: bool = false

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	#timer.connect("timeout", self, "_on_timer_timeout")

func on_enter():
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2):
	if (damageable.health > 0):
		is_hit = true
#		print_debug(is_hit)
#		character.velocity = knockback_speed  *  knockback_direction
		emit_signal("interrupt_state", self)
		#playback.travel(attack_animation_name)
		#print(" per hit")
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		print("character is dead")
#		character.velocity = Vector2.ZERO


func on_exit():
#	character.velocity = Vector2.ZERO
	is_hit = false
	print_debug(is_hit)
	
#	current_state = return_state
	playback.travel(run_animation_name)


func _on_timer_timeout():
	timer.stop()
	next_state = return_state
	#playback.travel(idle_animation_name)



#func _on_player_detector_body_entered(body):
#	playback.travel(attack_animation_name)
#

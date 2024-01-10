extends State

class_name HitStateAiTwo

@export var damageable: DamageableAiTwo
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export	var return_state: State #i asign to idle
@export	var current_state: State # i asign to hit
@export var attack_state: State # i asign to attack
@export var run_animation_name: String = "run"
@export var hit_animation: String = "hit"
@export var idle_animation_name: String = "idle"
@export var attack_animation_name: String = "attack"
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
	#else:
	elif (damageable.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		print("character is dead")


func _on_timer_timeout():
	timer.stop() #0.6
	next_state = return_state
	playback.travel(idle_animation_name)

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
	#else:
	elif (damageable.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		print("character is dead")


func _on_timer_timeout():
	if damageable.health > 0:
		next_state = return_state
		playback.travel(idle_animation)

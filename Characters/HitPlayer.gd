extends State

class_name HitPlayer

@export var playerhealth: PlayerHealth
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export	var return_state: State
@export var ground_state: State
@export var knockback_speed: float = 100
@onready var timer: Timer = $Timer


func _ready():
	playerhealth.connect("on_hit", on_damageable_hit)
#	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	#pass
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2):
	if (playerhealth.health > 0 ):
		emit_signal("interrupt_state", self)
	#else:
	elif (playerhealth.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		print("character is dead")


#func _on_timer_timeout():
#	timer.stop() #0.6
#	next_state = return_state


func _on_timer_timeout():
	timer.stop() #0.6
	next_state = return_state

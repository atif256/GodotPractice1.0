extends State

class_name HitPlayer

@export var playerhealth: PlayerHealth
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export	var return_state: State
@export var ground_state: State
@export var knockback_speed: float = 100


func _ready():
	playerhealth.connect("on_hit", on_damageable_hit)

func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2):
	if (playerhealth.health > 0 ):
		emit_signal("interrupt_state", self)
		next_state = return_state
	#else:
	elif (playerhealth.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		print("character is dead")


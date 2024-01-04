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

func on_enter(): # new add
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction: Vector2):
	if (playerhealth.health > 0 ):
		
		var knockback_velocity = knockback_direction * knockback_speed
		character.velocity = knockback_velocity
		emit_signal("interrupt_state", self)
		#next_state = return_state
	#else:
	elif (playerhealth.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		print("character is dead")


func _on_timer_timeout(): #new add
	next_state = return_state
	

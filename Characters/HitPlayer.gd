extends State #hit

class_name HitPlayer

@export var playerhealth: PlayerHealth
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export var hit_animation: String = "hit"
@export	var return_state: State #ground_state
@export var ground_state: State
@export var knockback_speed: float = 100


@onready var timer: Timer = $Timer # 0.3s

func _ready():
	playerhealth.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction: Vector2):
	if (playerhealth.health > 0 ):
		character.velocity = knockback_speed  *  knockback_direction
		emit_signal("interrupt_state", self)
		playback.travel(hit_animation)
#		next_state = return_state
	#else:
	elif (playerhealth.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		$"../../DeathSFX".play()
		
#		print("character is dead")

func _on_timer_timeout(): #new add
	next_state = return_state
	


func _on_animation_tree_animation_finished(anim_name):
	if (anim_name == hit_animation):
		next_state = return_state

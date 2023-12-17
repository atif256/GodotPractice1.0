extends State

class_name HitStateBoar

@export var damageable: DamageableBoar

#3 new added
@export var run_animation_name: String = "run"
@export var idle_animation_name: String = "idle"
@export var flip_sprite_on_run: bool = true

##to set a delay to knockback
#@export var run_delay: float = 0.01

@export var dead_state: State
@export var dead_animation_node: String = "dead"
@export var knockback_speed: float = 100
@export var return_state: State

@onready var timerboar : Timer = $Timer

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timerboar.start()

func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction: Vector2 ):
	if(damageable.health > 0): #>=
		character.velocity = knockback_speed  *  knockback_direction
		emit_signal("interrupt_state", self)
		playback.travel(run_animation_name)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)

func on_exit():
	character.velocity = Vector2.ZERO
	playback.travel(idle_animation_name)

func _on_timer_timeout():
	next_state = return_state

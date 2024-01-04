extends State

@export var damageable: BossOne
@export var return_state: State
@export var idle_state: State
@export var attack_state: State
@export var dead_state: State
@onready var timer: Timer = $Timer
@export var attack_one_animation: String = "attack1"
@export var dead_animation: String = "dead"
@export var hit_animation: String = "hit"
@export var knockback_speed: float = 2000 # up to more stronger push

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction: Vector2):
	if (damageable.health > 0 ):
		character.velocity = knockback_speed  *  knockback_direction
		emit_signal("interrupt_state", self)
		playback.travel(hit_animation)
	#else:
	elif (damageable.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation)
		print("character is dead")

func _on_timer_timeout():
	next_state = idle_state
	if (damageable.health == 70 ):
		next_state = attack_state
		emit_signal("interrupt_state", attack_state)
		playback.travel(attack_one_animation)
	if (damageable.health == 50 ):
		next_state = attack_state
		emit_signal("interrupt_state", attack_state)
		playback.travel(attack_one_animation)
	if (damageable.health == 30 ):
		next_state = attack_state
		emit_signal("interrupt_state", attack_state)
		playback.travel(attack_one_animation)
	if (damageable.health == 10 ):
		next_state = attack_state
		emit_signal("interrupt_state", attack_state)
		playback.travel(attack_one_animation)

func on_exit():
	character.velocity = Vector2.ZERO

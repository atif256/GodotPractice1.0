extends State

@export var damageable: BossOne
@export var return_state: State
@export var idle_state: State
@export var attack_state: State
@export var dead_state: State
@onready var timer: Timer = $Timer
@export var attack_one_animation: String = "attack1"
@export var dead_animation: String = "dead"
@export var idle_animation: String = "idle"
@export var hit_animation: String = "hit"
@export var knockback_speed: float = 2000 # up to more stronger push asal 2000
var player_body: bool = false

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction: Vector2):
	if (damageable.health > 0 ):
		character.velocity = knockback_speed  *  knockback_direction
		emit_signal("interrupt_state", self)
		playback.travel(hit_animation)
		print("enemy is hit")
	#else:
	elif (damageable.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation)
#		if dead_state:
#			playback.travel(dead_animation)
#			print("character is dead")

func _on_timer_timeout():
#	if not player_body:
	next_state = idle_state
	playback.travel(idle_animation)
#	if player_body && damageable.health == 140:
#		next_state = attack_state
#		playback.travel(attack_one_animation)
#	elif player_body && damageable.health == 110:
#		next_state = attack_state
#		playback.travel(attack_one_animation)
#	elif player_body && damageable.health == 100:
#		next_state = attack_state
#		playback.travel(attack_one_animation)
#	elif player_body && damageable.health == 80:
#		next_state = attack_state
#		playback.travel(attack_one_animation)
	if (damageable.health == 140 ): #random 140 or 130 or 120. choose one
		next_state = attack_state
		emit_signal("interrupt_state", attack_state)
		playback.travel(attack_one_animation)
	if (damageable.health == 110 ): #random 110 or 100 or 90. choose one
		next_state = attack_state
		emit_signal("interrupt_state", attack_state)
		playback.travel(attack_one_animation)
	if (damageable.health == 80 ): #random 80 or 70 or 60. choose one
		next_state = attack_state
		emit_signal("interrupt_state", attack_state)
		playback.travel(attack_one_animation)
	if (damageable.health == 50 ): #random 50 or 40 or 30 or 20. choose one
		next_state = attack_state
		emit_signal("interrupt_state", attack_state)
		playback.travel(attack_one_animation)


func on_exit():
	character.velocity = Vector2.ZERO




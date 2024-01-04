extends State


@export	var current_state: State
@export	var attack_state: State
@export	var return_state: State

@export var attack_one_animation: String = "attack1"
@export var idle_animation: String = "idle"

@onready var timer: Timer = $TimerAttack1

func on_enter():
	timer.start()


func _on_player_detect_to_attack_1_body_entered(body):
	current_state = attack_state
	playback.travel(attack_one_animation)
	emit_signal("interrupt_state", attack_state)



func _on_timer_attack_1_timeout():
	next_state = return_state
	playback.travel(idle_animation)

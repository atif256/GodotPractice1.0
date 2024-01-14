extends State


@export	var current_state: State #idle_state
@export	var attack_state: State
@export var attack_two_state: State
@export	var return_state: State #idle_state

@export var attack_one_animation: String = "attack1"
@export var attack_two_animation: String = "attack2"
@export var idle_animation: String = "idle"


@onready var timer: Timer = $TimerAttack1 #9s


func on_enter():
	timer.start()

func _on_player_detect_to_attack_1_body_entered(_body):
#	current_state = attack_state
#	emit_signal("interrupt_state", attack_state)
	
	var chance = randi() % 2
	match chance:
		0:
			current_state = attack_state
			emit_signal("interrupt_state", attack_state)
			playback.travel(attack_one_animation)
			await animation_player.animation_finished
			
		1:
			current_state = attack_two_state
			emit_signal("interrupt_state", attack_two_state)
			playback.travel(attack_two_animation)
			await animation_player.animation_finished




func _on_timer_attack_1_timeout():
	if attack_state:
		next_state = return_state
		playback.travel(idle_animation)
	elif attack_two_state:
		next_state = return_state
		playback.travel(idle_animation)


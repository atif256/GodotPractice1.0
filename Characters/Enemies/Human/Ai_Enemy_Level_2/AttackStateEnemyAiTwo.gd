extends State

class_name EnemyAttackStateMachineAiTwo

@export var attack_animation_name: String = "attack"
@export var dead_animation_name: String = "dead"
@export var run_animation_name: String = "run"
@export var idle_animation_name: String = "idle"
#note that emit signal is to use to call a change in state machine
@export var return_state: State
@export var current_state: State
@export var idle_state: State
@export var attack_state: State
#@export var run_state: State

@onready var timer: Timer = $Timer
#@onready var animation_tree: AnimationTree = $AnimationTree

func _ready():
	pass
	

func _on_player_detector_body_entered(_body):
	current_state = attack_state
	emit_signal("interrupt_state", attack_state)
	timer.start()
	playback.travel(attack_animation_name)


func _on_player_detector_body_exited(_body):
	current_state = return_state
	emit_signal("interrupt_state", return_state)
	playback.travel(run_animation_name)


func _on_timer_timeout():
#	print("Timer timeout")
	next_state = return_state



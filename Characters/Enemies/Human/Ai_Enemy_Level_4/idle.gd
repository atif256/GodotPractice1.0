extends State

@export var follow_state: State
@export var current_state: State
@export var idle_state: State
@export var walk_animation: String = "walk"
@export var hit_animation: String = "hit"
@export var idle_animation: String = "idle"



func on_enter():
	pass

func _on_player_detector_body_entered(body):
	next_state = follow_state
	
	print_debug(next_state)
	emit_signal("interrupt_state", follow_state)

func on_exit():
	next_state = follow_state
	playback.travel(walk_animation)
	

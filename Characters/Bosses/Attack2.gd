extends State

@onready var timer = $Timer
@export var idle_animation: String = "idle"
@export	var return_state: State #idle_state

func enter():
	timer.start




func _on_timer_timeout():
	next_state = return_state
	playback.travel(idle_animation)

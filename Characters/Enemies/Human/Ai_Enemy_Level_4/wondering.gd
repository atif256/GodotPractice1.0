extends State

#@export var follow_state: State
#@export var idle_state: State
#@export var return_state: State
#
#@onready var timer = $Timer
#
#func on_enter():
#	timer.start()
#
#
#
#func _on_timer_timeout():
#	next_state = return_state

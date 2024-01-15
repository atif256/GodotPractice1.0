extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false
@onready var camera2d = $Camera2D
@onready var player = $Player
var raycast : RayCast2D = null

func _ready():
	raycast = get_node("Player/world")
	get_tree().set_pause(false)
	Engine.time_scale = 1

func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		pauseMenu()

func pauseMenu():
	if raycast != null and raycast.is_colliding():
		if paused:
			pause_menu.hide()
			Engine.time_scale = 1
		else:
			pause_menu.show()
			Engine.time_scale = 0
	
		paused = !paused
	elif raycast == null:
		if paused:
			pause_menu.hide()
			Engine.time_scale = 1
		else:
			pause_menu.show()
			Engine.time_scale = 0
		paused = !paused
	else:
		print("cannot pause meh")

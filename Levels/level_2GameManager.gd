extends Node2D


@onready var pause_menu = $PauseMenu
var paused = false


func _ready():
	get_tree().set_pause(false)
	Engine.time_scale = 1

func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused




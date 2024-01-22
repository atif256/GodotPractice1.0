extends Node2D


@onready var pause_menu = $PauseMenu
var paused = false
@onready var camera2d = $Camera2D
@onready var player = $Player
var raycast : RayCast2D = null
@onready var finish_line = $FinishedScene
@onready var unfinish_line = $CollectMoreCoins


func _ready():
#	raycast = get_node("/root/TestLevel/Player/world")
	raycast = get_node("Player/world")
	get_tree().set_pause(false)
	Engine.time_scale = 1

func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		pauseMenu()

#func pauseMenu():
#	if paused:
#		pause_menu.hide()
#		Engine.time_scale = 1
#	else:
#		pause_menu.show()
#		Engine.time_scale = 0
#
#	paused = !paused


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


func _on_finished_line_body_entered(body):
	var player_health = get_node("Player/PlayerHealth")
	if player_health != null and player_health.has_method("get_score"):
		var score = player_health.get_score()
		# Check if the score is greater than or equal to 10 to show finish line
		if score >= 10:
			finish_line.visible = true
			unfinish_line.visible = false
			
		else:
			unfinish_line.visible = true
			print("collect more coin to pass")

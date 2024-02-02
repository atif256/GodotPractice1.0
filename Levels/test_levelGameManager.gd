extends Node2D

class_name TestLevel

@onready var pause_menu = $PauseMenu
var paused = false
@onready var camera2d = $Camera2D
@onready var player = $Player
var raycast : RayCast2D = null
@onready var finish_line = $FinishedScene
@onready var unfinish_line = $CollectMoreCoins
@onready var next_level_menu = $NextLevelMenu
var completed = false

var is_inventory_closed: bool = true
#signal level_unlocked(level_number)

#inventory system testing
#@onready var inv: Inv = preload("res://UI/InventoryUI/playerinv.tres")
##@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
#@onready var slots: Array = $InventoryPlayerUI/Control/NinePatchRect/GridContainer.get_children()
@onready var inv: Inv = preload("res://UI/InventoryUI/playerinv.tres")

func _ready():
#	raycast = get_node("/root/TestLevel/Player/world")
	raycast = get_node("Player/world")
	get_tree().set_pause(false)
	Engine.time_scale = 1
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false)
	$AudioStreamPlayer2D.play()
	
	#inventory system
#	inv.update.connect(update_slots)
#	update_slots()
	inv.reset_slot()


func _process(_delta):
	if Input.is_action_just_pressed("esc") && completed == false:
		pauseMenu()
	death_menu()
	if Input.is_action_just_pressed("tab"): #to open inventory
		if is_inventory_closed:
			inventory_open()
		else:
			inventory_closed()

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
			AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false) #resume the SFX
		else:
			pause_menu.show()
			Engine.time_scale = 0
			AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), true) #pause the SFX sound
	
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

func inventory_open():
	$InventoryPlayerUI.visible = true
	is_inventory_closed = false
func inventory_closed():
	$InventoryPlayerUI.visible = false
	is_inventory_closed = true


func _on_finished_line_body_entered(_body):
	var player_health = get_node("Player/PlayerHealth")
	if player_health != null and player_health.has_method("get_score"):
		var score = player_health.get_score()
		if score >= 10:
			finish_line.visible = true
			unfinish_line.visible = false
		else:
			unfinish_line.visible = true
			print("collect more coin to pass")


func _on_door_to_next_level_body_entered(_body):
	if finish_line.visible:
#		next_level_menu.show()
#		completed = true # TO MAKE SURE THE PAUSE MENU NOT BEEN EXECUTED
#		Engine.time_scale = 0
		#just asign next level
		get_tree().change_scene_to_file("res://Levels/level_1.tscn")
		ControlLevelmenu.level1 = true
#		print_debug("level1 = ", ControlLevelmenu.level1)
		ControlLevelmenu.save_data()

func death_menu():
	if player == null:
		$DeathSceneMenu.visible = true
		$AudioStreamPlayer2D.stop()

#func update_slots():
#	for i in range(min(inv.slots.size(), slots.size())):
#		slots[i].update(inv.slots[i])

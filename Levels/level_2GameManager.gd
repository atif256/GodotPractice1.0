extends Node2D

@onready var pause_menu = $PauseMenu
var paused = false
@onready var camera2d = $Camera2D
@onready var player = $Player
var raycast : RayCast2D = null


var is_inventory_closed: bool = true
@onready var inv: Inv = preload("res://UI/InventoryUI/playerinv.tres")

func _ready():
	raycast = get_node("Player/world")
	get_tree().set_pause(false)
	Engine.time_scale = 1
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false)
	$AudioStreamPlayer2D.play()
	inv.reset_slot()

func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		pauseMenu()
	death_menu()
	if Input.is_action_just_pressed("tab"): #to open inventory
		if is_inventory_closed:
			inventory_open()
		else:
			inventory_closed()


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

func inventory_open():
	$InventoryPlayerUI.visible = true
	is_inventory_closed = false
func inventory_closed():
	$InventoryPlayerUI.visible = false
	is_inventory_closed = true

func death_menu():
	if player == null:
		$DeathSceneMenu.visible = true
		$AudioStreamPlayer2D.stop()

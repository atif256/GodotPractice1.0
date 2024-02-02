extends StaticBody2D #this is for chest

@onready var key_item = get_parent().find_child("Key") # is to open Chess
@onready var key_item_2 = get_parent().find_child("Key2") # is to open Chess2
var in_chest_zone: bool = false
var chest_is_open = false
var corresponding_chest: Node = null
@export var item: InvItem
@onready var player = get_parent().find_child("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		open_chest()

func _on_chest_area_2d_body_entered(body): #for Chest
	corresponding_chest = get_parent().find_child("Chest")
	if !chest_is_open:
		in_chest_zone = true
#		print("in Chest zone")
		$Chat.visible = true
func _on_chest_area_2d_body_exited(body):
	in_chest_zone = false
	$Chat.visible = false

func _on_chest_2_area_2d_body_entered(body): #for Chest2
	corresponding_chest = get_parent().find_child("Chest2")
	if !chest_is_open:
#		print("in Chest2 zone")
		in_chest_zone = true
		$Chat.visible = true
func _on_chest_2_area_2d_body_exited(body):
	in_chest_zone = false
	$Chat.visible = false

func open_chest():
	if in_chest_zone and !chest_is_open and key_item == null and corresponding_chest == get_parent().find_child("Chest"):
		_on_key_collected()
	elif in_chest_zone and !chest_is_open and key_item_2 == null and corresponding_chest == get_parent().find_child("Chest2"):
		_on_key_collected_2()

func _on_key_collected(): # only key_item can open the Chest
	chest_is_open = true
	player.drop(item) # drop -1 for item1
	$open.visible = true
	$closed.visible = false
	$Chat.visible = false

func _on_key_collected_2(): # only key_item_2 can open the Chest2
	chest_is_open = true
	player.drop(item) # drop -1 for item1. i want the output in here is drop -1 for item2. in here error is related to the player
	$open.visible = true
	$closed.visible = false
	$Chat.visible = false










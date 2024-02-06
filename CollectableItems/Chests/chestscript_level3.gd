extends StaticBody2D #this is for chest

# for level 3
@onready var key_item = get_parent().find_child("Key") # is to open Chess
@onready var key_item_2 = get_parent().find_child("Key2") # is to open Chess2
@onready var key_item_3 = get_parent().find_child("Key3") # is to open Chess3
var in_chest_zone: bool = false
var chest_is_open = false
var corresponding_chest: Node = null
@export var item: InvItem
@onready var player = get_parent().find_child("Player")

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		open_chest()

func _on_chest_area_2d_body_entered(body: Player): #for Chest
	corresponding_chest = get_parent().find_child("Chest")
	if !chest_is_open:
		in_chest_zone = true
		$Chat.visible = true
func _on_chest_area_2d_body_exited(body: Player):
	in_chest_zone = false
	$Chat.visible = false

func _on_chest_2_area_2d_body_entered(body: Player): #for Chest2
	corresponding_chest = get_parent().find_child("Chest2")
	if !chest_is_open:
		in_chest_zone = true
		$Chat.visible = true
func _on_chest_2_area_2d_body_exited(body: Player):
	in_chest_zone = false
	$Chat.visible = false

func _on_chest_3_area_2d_body_entered(body: Player):
	corresponding_chest = get_parent().find_child("Chest3")
	if !chest_is_open:
		in_chest_zone = true
		$Chat.visible = true

func _on_chest_3_area_2d_body_exited(body: Player):
	in_chest_zone = false
	$Chat.visible = false


func open_chest():
	if in_chest_zone and !chest_is_open and key_item == null and corresponding_chest == get_parent().find_child("Chest"):
		_on_key_collected()
	elif in_chest_zone and !chest_is_open and key_item_2 == null and corresponding_chest == get_parent().find_child("Chest2"):
		_on_key_collected_2()
	elif in_chest_zone and !chest_is_open and key_item_3 == null and corresponding_chest == get_parent().find_child("Chest3"):
		_on_key_collected_3()

func _on_key_collected():
	chest_is_open = true
	player.drop(item)
	$open.visible = true
	$closed.visible = false
	$Chat.visible = false
	StarholderBus.star_visibility10 = true
	StarholderBus.save_star()

func _on_key_collected_2(): 
	chest_is_open = true
	player.drop(item) 
	$open.visible = true
	$closed.visible = false
	$Chat.visible = false
	StarholderBus.star_visibility11 = true
	StarholderBus.save_star()

func _on_key_collected_3():
	chest_is_open = true
	player.drop(item) 
	$open.visible = true
	$closed.visible = false
	$Chat.visible = false
	StarholderBus.star_visibility12 = true
	StarholderBus.save_star()


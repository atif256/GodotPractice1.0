extends StaticBody2D #this is for chest

# for level 0 tutorial
@onready var key_item = get_parent().find_child("Key") # is to open Chess
@onready var key_item_2 = get_parent().find_child("Key2") # is to open Chess2
@onready var key_item_3 = get_parent().find_child("Key3") # is to open Chess3
var in_chest_zone: bool = false
var chest_is_open = false
var corresponding_chest: Node = null
@export var item: InvItem
@onready var player = get_parent().find_child("Player")

#new
@onready var marker = $Marker2D



func _process(delta):
	if Input.is_action_just_pressed("interact"):
		open_chest()

func _on_chest_area_2d_body_entered(body): #for Chest
	corresponding_chest = get_parent().find_child("Chest")
	if !chest_is_open:
		in_chest_zone = true
		$Chat.visible = true
func _on_chest_area_2d_body_exited(body):
	in_chest_zone = false
	$Chat.visible = false

func _on_chest_2_area_2d_body_entered(body): #for Chest2
	corresponding_chest = get_parent().find_child("Chest2")
	if !chest_is_open:
		in_chest_zone = true
		$Chat.visible = true
func _on_chest_2_area_2d_body_exited(body):
	in_chest_zone = false
	$Chat.visible = false

func _on_chest_3_area_2d_body_entered(body):
	corresponding_chest = get_parent().find_child("Chest3")
	if !chest_is_open:
		in_chest_zone = true
		$Chat.visible = true

func _on_chest_3_area_2d_body_exited(body):
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
	StarholderBus.star_visibility1 = true
	StarholderBus.save_star()
	call_deferred("drop_quest_item")

func _on_key_collected_2(): 
	chest_is_open = true
	player.drop(item) 
	$open.visible = true
	$closed.visible = false
	$Chat.visible = false
	StarholderBus.star_visibility2 = true
	StarholderBus.save_star()
	call_deferred("drop_quest_item")

func _on_key_collected_3():
	chest_is_open = true
	player.drop(item) 
	$open.visible = true
	$closed.visible = false
	$Chat.visible = false
	StarholderBus.star_visibility3 = true
	StarholderBus.save_star()
	call_deferred("drop_quest_item")

func drop_quest_item():
#	const coin = preload("res://CollectableItems/Coins/coins_collectable.tscn")
	const coin = preload("res://CollectableItems/Quest Items/Ring_Quest_item.tscn")
	var coin_drop = coin.instantiate()
	get_tree().get_root().add_child(coin_drop)
	coin_drop.global_position = marker.global_position

#call_deferred("drop_quest_item")

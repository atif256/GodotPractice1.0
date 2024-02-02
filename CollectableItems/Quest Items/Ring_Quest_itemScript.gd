extends StaticBody2D

@onready var player = get_parent().find_child("Player")
var ringtaken = false
var zone_pick_up = false

@export var item: InvItem

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		if zone_pick_up:
			collect_ring()

func collect_ring():
	player.collect(item)
	queue_free()

func _on_area_2d_body_entered(body: Player):
	zone_pick_up = true
	$Chat.visible = true

func _on_area_2d_body_exited(body):
	zone_pick_up = false
	$Chat.visible = false

extends CharacterBody2D

@export var item: InvItem
@onready var player = get_parent().find_child("Player")
#@export var inv: Inv
#@export var item: InvItem

@onready var sprite = $Sprite2D
@onready var ring = get_parent().find_child("ring")

var direction: Vector2
var near_npc = false

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		give_ring()
		
	if !player == null:
		direction = player.position - position
		if direction.x < 0: 
			sprite.flip_h = true
		else:
			sprite.flip_h = false
#		emit_signal("facing_direction_changed", sprite.flip_h)

func give_ring():
	if near_npc and ring != null:
		player.drop(item)



func _on_player_detection_body_entered(body):
	near_npc = true
	$Label.visible = true


func _on_player_detection_body_exited(body):
	near_npc = false
	$Label.visible = false


#func _process(_delta):
	if !player == null:
		direction = player.position - position
		if direction.x < 0: 
			sprite.flip_h = false
		else:
			sprite.flip_h = true
#		emit_signal("facing_direction_changed", sprite.flip_h)

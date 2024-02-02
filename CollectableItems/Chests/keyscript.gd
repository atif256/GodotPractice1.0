extends StaticBody2D #this is for key

var in_key_zone: bool = false
var keytaken: bool = false
signal key_collected
@onready var player = get_parent().find_child("Player")

# for different variant of type
@export var item: InvItem
@export var texture_sprite: Sprite2D

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		collect_key()

func _on_playerdetector_body_entered(body: Player):
	in_key_zone = true
	$Chat.visible = true

func _on_playerdetector_body_exited(body: Player):
	in_key_zone = false
	$Chat.visible = false

func collect_key():
	if in_key_zone and !keytaken:
		keytaken = true
		player.collect(item)
		$Chat.visible = false
		emit_signal("key_collected")
		queue_free()


extends CharacterBody2D

var is_chatting = false
var player_in_chat_zone = false
var player

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		if player_in_chat_zone:
			$Dialogue.start()
			is_chatting = true


func _on_chat_detection_area_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			print("player as enter the chat zone")
			$Chat.visible = true
			player_in_chat_zone = true


func _on_chat_detection_area_body_exited(body):
	for child in body.get_children():
		if child is PlayerHealth:
			print("player left the chat zone")
			$Chat.visible = false
			player_in_chat_zone = false


func _on_dialogue_dialogue_finished():
	is_chatting = false
	player_in_chat_zone = false
	$Chat.visible = false
	

extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var center_sprite = $CenterSprite

var direction: Vector2
@onready var animation_tree: AnimationTree = $AnimationTree


func _ready():
	set_physics_process(false)
	animation_tree.active = true



func _process(delta):
	if player != null:
		direction = player.position - position
		
		if direction.x < 0: 
			center_sprite.scale.x = 1
		else:
			center_sprite.scale.x = -1
	

func _physics_process(delta):
	velocity = direction.normalized() * 100
	move_and_collide(velocity * delta)
	transition()



func _on_player_detector_body_entered(body):
	set_physics_process(true)
	direction = player.position - position


func transition():
	var distance = direction.length()
	if distance > 300:
		set_physics_process(false)
	if distance < 30:
		pass


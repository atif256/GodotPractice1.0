extends CharacterBody2D

@export var movement_speed: float = 60.0 #40.0
@export var starting_move_direction: Vector2 = Vector2.LEFT
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var raycast: RayCast2D = $RayCast2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	if ($AnimationPlayer.current_animation == "attack"):
		
		starting_move_direction = Vector2.ZERO
		
		animation_tree.active = false
		
#	else:
#		var direction: Vector2 =starting_move_direction
#		if direction:
#			velocity.x = direction.x * movement_speed
		
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction: Vector2 =starting_move_direction
	if direction:
		velocity.x = direction.x * movement_speed
	detect_turn_around()
	move_and_slide()
	

func detect_turn_around():

	if !raycast.is_colliding() && is_on_floor():
		scale.x = -scale.x
		turn_around()

func turn_around():
	starting_move_direction = - starting_move_direction


func _on_player_detector_body_entered(body):
	$AnimationPlayer.play("attack")
	#velocity.x = 0.0
	print("hit")




extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
const speed_bee = 100.0
var fly_direction: Vector2= Vector2.LEFT
var initial_position: Vector2
var distance_to_move =200.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	animation_tree.active = true
	initial_position = global_position
	#adistance_to_move =0

func _physics_process(delta):
	velocity = speed_bee * fly_direction
	var distance_moved = global_position.x - initial_position.x
	
	
	if (distance_to_move >=100):
		fly_direction = Vector2.RIGHT
		
		if abs(distance_moved) >= distance_to_move:
		# Change direction and flip the sprite
			fly_direction *= -45
			
	move_and_slide()

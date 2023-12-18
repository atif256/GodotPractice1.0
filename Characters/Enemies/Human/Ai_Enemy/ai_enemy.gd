extends CharacterBody2D


#const SPEED = 30.0
@export var movement_speed: float = 40.0
@export var starting_move_direction: Vector2 = Vector2.RIGHT
#const JUMP_VELOCITY = -400.0
@onready var animation_tree: AnimationTree = $AnimationTree
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: Vector2 =starting_move_direction
	if direction:
		velocity.x = direction.x * movement_speed
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

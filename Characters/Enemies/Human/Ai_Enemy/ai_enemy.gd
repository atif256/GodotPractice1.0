extends CharacterBody2D

@export var movement_speed: float = 40.0
@export var starting_move_direction: Vector2 = Vector2.RIGHT
@onready var animation_tree: AnimationTree = $AnimationTree
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction: Vector2 =starting_move_direction
	if direction:
		velocity.x = direction.x * movement_speed


	move_and_slide()

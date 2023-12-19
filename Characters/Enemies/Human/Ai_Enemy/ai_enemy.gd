extends CharacterBody2D

class_name Ai_Enemy

@export var movement_speed: float = 60.0 #60.0
@export var starting_move_direction: Vector2 = Vector2.LEFT
@onready var animation_tree: AnimationTree = $AnimationTree
#@export var attack_animation: String = "attack"
@onready var raycast: RayCast2D = $RayCast2D
@export var hit_state: State
@export var dead_state: State
@export var attack_state: State

var attack_animation_name: String = "attack"

@onready var state_machine: CharacterStateMachine = $CharacterStateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var direction: Vector2 = starting_move_direction
	if direction && state_machine.check_if_can_move():
		velocity.x = direction.x * movement_speed
		
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		
	elif state_machine.current_state != dead_state:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		
	elif state_machine.current_state != attack_state:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		
	detect_turn_around()
	move_and_slide()
	

func detect_turn_around():
	if !raycast.is_colliding() && is_on_floor():
	#if !raycast.is_colliding() && is_on_floor() && state_machine.check_if_can_move() :
		scale.x = -scale.x
		turn_around()
#	if 

func turn_around():
	starting_move_direction = - starting_move_direction
#	print("turn around")

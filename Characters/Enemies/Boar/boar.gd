extends CharacterBody2D


@onready var animation_tree: AnimationTree = $AnimationTree
@export var hit_state: State

#4 new add
#@export var movement_speed_boar: float = 30.0
#@export var hit_state_boar: State
#@export var starting_move_direction: Vector2 = Vector2.LEFT
#@onready var state_machine: CharacterStateMachine = $CharacterStateMachine

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true
	#pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
#new add to move the boar
#	var direction: Vector2 = starting_move_direction
#	if direction && state_machine.check_if_can_move():
#		velocity.x = direction.x * movement_speed_boar
#	elif state_machine.current_state != hit_state_boar:
#		velocity.x = move_toward(velocity.x, 0, movement_speed_boar)

	move_and_slide()

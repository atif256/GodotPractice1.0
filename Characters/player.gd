extends CharacterBody2D

class_name Player

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine:CharacterStateMachine = $CharacterStateMachine
@onready var run_sfx: AudioStreamPlayer2D = $RunningSFX

@export var hit_state: State
@export var attack_state: State
@export var speed: float = 200.0

@export var inv: Inv

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: Vector2 = Vector2.ZERO

signal facing_direction_changed(facing_right: bool)

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	if Engine.time_scale == 0: #skip the phy process if the game is pause
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if run_sfx.is_playing():
			run_sfx.stop()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	
	#control landing
	if direction.x !=0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
		
		if not run_sfx.is_playing():
			run_sfx.play()
		
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, speed)
		run_sfx.stop()
	elif state_machine.current_state == attack_state:
		velocity.x = move_toward(velocity.x, 0, speed)
		run_sfx.stop()
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		run_sfx.stop()

	move_and_slide()
	update_animation_parameter()
	update_facing_direction()

func update_animation_parameter():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
		
	elif direction.x < 0:
		sprite.flip_h = true
		
	emit_signal("facing_direction_changed", !sprite.flip_h)

func player():
	pass

func collect(item):
	$CollectItemSFX.play()
	inv.insert(item)

func drop(item):
	inv.destroy(item)
	print("drop -1 for " + item.name) # drop -1 for item1

#func drop_item2(item2):
#	inv.destroy_item2(item2)
#	print("drop -1 for " + item2.name) # drop -1 for item2

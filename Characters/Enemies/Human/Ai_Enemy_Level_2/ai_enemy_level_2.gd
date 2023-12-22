extends CharacterBody2D

class_name Ai_Enemy2

var player = null
var enemy_chase: bool = false
@export var slow_chase: float = 10.0
@export var forward_speed: float = 20
@export var walk_animation_name: String = "walk"
var has_flipped: bool = false
@onready var enemy_node: CharacterBody2D = $"."
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var sprite: Sprite2D = $Sprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	
	move_and_slide()

#new added
var direction: Vector2 = Vector2.ZERO
func update_animation_parameter():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
	
	emit_signal("facing_direction_changed", !sprite.flip_h)

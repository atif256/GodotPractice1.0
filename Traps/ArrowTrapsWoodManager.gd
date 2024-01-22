extends CharacterBody2D


var arrow_scene = preload("res://Characters/Enemies/Human/Ai_Enemy_Level_3/arrow/arrow.tscn")
#@onready var animation_tree: AnimationTree = $AnimationTree

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass
#	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()

func spawn_arrow():
	await get_tree().create_timer(0.4).timeout
	var arrow_ins = arrow_scene.instantiate()
	arrow_ins.global_position = $SpamArrow.global_position
	add_child(arrow_ins)


func _on_player_detector_body_entered(body):
	call_deferred("spawn_arrow")

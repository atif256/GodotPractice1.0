extends CharacterBody2D

class_name bossone

const speed = 5000.0
const jump_velocity = -80.0

@onready var raycast1: RayCast2D = $PlayerDetectorbehind
@onready var raycast2: RayCast2D = $DetectorToClose
@onready var animation_tree: AnimationTree = $AnimationTree
var direction: Vector2 = Vector2.ZERO
@onready var timer: Timer = $TimerToFlip

var purple_fire = preload("res://Characters/Bosses/purple_fire_spawn.tscn")

signal facing_direction_changed(facing_right: bool)

#signal facing_direction_changed(facing_left: bool)
#var facing_right: bool = true
@onready var sprite: Sprite2D = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#var gravity = 300

func _ready():
	animation_tree.active =true
	
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
	detect_turn_around()
	jump_behind()
	update_animation_parameter()
#	update_facing_direction()

func detect_turn_around(): #the current sprite is facing to the right ->
	if raycast1.is_colliding():
		scale.x = -scale.x #the player approch from back it will flip to the left <-
		print("now left") #it always the same so if the sprite is flip but the method of scale.x = -scale.x the the knockback direction is still to the right +x
		


func jump_behind():
	if raycast2.is_colliding() && timer.is_stopped(): # what i want here israycast2.is_colliding()
		print("the enemy should move to back 100")
		delay_jump_behind()
	if !raycast2.is_colliding():
		velocity.x = 0
		velocity.y = gravity

func delay_jump_behind():
	velocity.y = jump_velocity
	velocity.x = speed
	update_animation_parameter()


func update_animation_parameter():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
		print("kanan")
	elif direction.x < 0:
		sprite.flip_h = true
		print("kiri")
#	if (facing_right == true):
#		sprite.flip_h = false
#	elif (facing_right == false):
#		sprite.flip_h = true
	
	emit_signal("facing_direction_changed", !sprite.flip_h)



#to handle fire_spawn

func _on_player_detect_to_attack_1_body_entered(body):
	call_deferred("fire_spawn")

func fire_spawn():
	await get_tree().create_timer(0.4).timeout
	var fire_ins = purple_fire.instantiate()
	fire_ins.global_position = $FireMagicSpawnPoint.global_position
	add_child(fire_ins)
#	print("hoiiii")

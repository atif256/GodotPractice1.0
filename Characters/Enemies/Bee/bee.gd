extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var anim_player = $AnimationPlayer
@onready var player = get_parent().find_child("Player")
@onready var sprite = $Sprite2D
@onready var timer = $Timer

@export var damageable: DamageableBee
@export var hit_animation: String = "hit"
@export var facing_direction: BeeFacingDirection

var direction: Vector2
var damage: int = 2

signal facing_direction_changed(facing_right: bool)
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	set_physics_process(false)
	damageable.connect("on_hit", on_damageable_hit)
	$".".connect("facing_direction_changed", _on_player_facing_direction_changed)
	

func _process(_delta):
	if !player == null:
		direction = player.position - position
		if direction.x < 0: 
			sprite.flip_h = false
		else:
			sprite.flip_h = true
		emit_signal("facing_direction_changed", sprite.flip_h)

func _physics_process(delta):
	if damageable.health > 0:
		velocity = direction.normalized() * 100
	elif damageable.health == 0:
		set_physics_process(false)
		anim_player.play("hit")
	move_and_collide(velocity * delta)


func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2 ):
	if(damageable.health > 0):
		set_physics_process(false)
		timer.start()
		#to asign a knockback later
		call_deferred("health_floating")
	elif damageable.health == 0:
		call_deferred("health_floating")

func health_floating():
	const floating = preload("res://UI/health_floating_indicator.tscn")
	var health_floating_node = floating.instantiate()
	get_tree().get_root().add_child(health_floating_node)
	health_floating_node.global_position = $".".global_position

func _on_timer_timeout():
	set_physics_process(true)

func _on_player_detector_body_entered(body):
	if damageable.health > 0:
		set_physics_process(true)
		anim_player.play("fly")
	else:
		set_physics_process(false)
		anim_player.play("hit")


func _on_sting_body_entered(body):
	if damageable.health > 0:
		set_physics_process(false)
		anim_player.play("sting")
	else:
		set_physics_process(false)
		anim_player.play("hit")

func _on_sting_body_exited(body):
	if damageable.health > 0:
		set_physics_process(true)
		anim_player.play("fly")
#	elif damageable.health == 0:
#		set_physics_process(false)
#		anim_player.play("hit")

func _on_sting_damage_body_entered(body):
	if damageable.health > 0:
		for child in body.get_children():
			if child is PlayerHealth:
				child.hit(damage,Vector2.ZERO)
	else:
		set_physics_process(false)
		anim_player.play("hit")

func _on_player_facing_direction_changed(facing_right: bool):
	if facing_right:
		facing_direction.position = facing_direction.facing_right_position
	else:
		facing_direction.position = facing_direction.facing_left_position

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == hit_animation):
		$".".queue_free()





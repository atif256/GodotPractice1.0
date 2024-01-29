extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var timer = $Timer
@onready var sprite = $Sprite2D
@onready var anim_player = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree

@export var facing_direction: BoarWhiteFacingDirection
@export var damageable: DamageableBoarWhite
@export var knockback_speed: float = 100

var speed = 100
var damage: int = 10
var direction: Vector2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal facing_direction_changed(facing_right: bool)

func _ready():
	set_physics_process(false)
	$".".connect("facing_direction_changed", _on_player_facing_direction_changed)
	damageable.connect("on_hit", on_damageable_hit)

func _process(_delta):
	if !player == null:
		direction = player.position - position
		if direction.x < 0: 
			sprite.flip_h = false
		else:
			sprite.flip_h = true
		emit_signal("facing_direction_changed", sprite.flip_h)
	else:
		set_physics_process(false)
		anim_player.play("idle")
		
	if !$Floordetector.is_colliding():
		set_physics_process(false)
		anim_player.play("idle")


func _physics_process(delta):
	if damageable.health > 0:
		velocity.x = direction.normalized().x * 80
		velocity.y = 0 
		move_and_collide(velocity * delta)
		transition()
	elif damageable.health <= 0:
		anim_player.play("dead")
		set_physics_process(false)
		call_deferred("health_floating")
		
	update_animation_parameter()


func update_animation_parameter():
	animation_tree.set("parameters/move/blend_position", direction.x)


#just added
func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2 ):
	if(damageable.health > 0):
		set_physics_process(false)
		timer.start()
		#to asign a knockback later
		call_deferred("health_floating")

func health_floating():
	const floating = preload("res://UI/health_floating_indicator.tscn")
	var health_floating_node = floating.instantiate()
	get_tree().get_root().add_child(health_floating_node)
	health_floating_node.global_position = $".".global_position

func _on_timer_timeout():
	set_physics_process(true)

func _on_playerdetectionarea_2d_body_entered(_body): #radius is 90
	if damageable.health > 0:
		anim_player.play("run")
		set_physics_process(true)
	else:
		set_physics_process(false)

func transition():
	if damageable.health > 0:
		var enemy_distance = $".".direction.length()
		if enemy_distance < 60:
			set_physics_process(true)
		
		if enemy_distance > 200:
			set_physics_process(false)
#			print("too far")
			anim_player.play("idle")

func _on_damage_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			child.hit(damage,Vector2.ZERO)

func _on_player_facing_direction_changed(facing_right: bool):
	if facing_right:
		facing_direction.position = facing_direction.facing_right_position
	else:
		facing_direction.position = facing_direction.facing_left_position


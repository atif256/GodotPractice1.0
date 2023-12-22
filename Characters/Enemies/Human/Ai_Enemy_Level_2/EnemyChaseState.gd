extends State

var player = null
#var controlled_object: Node2D = null
var enemy_chase: bool = false
@export var slow_chase: float = 50.0
var has_flipped: bool = false
@export var run_animation_name: String = "run"
@export var idle_animation_name: String = "idle"
@export var attack_animation_name: String = "attack"
@export var dead_animation_name: String = " dead"
@export var chase_run: State
@export var attack_state:State
@export var idle_state: State
@export var dead_state: State

func _ready():
	pass

func _physics_process(delta):
	if enemy_chase and player:
		# Access the position property of the controlled object
		controlled_object.position += (player.global_position - controlled_object.global_position) / slow_chase

func _on_chase_to_left_body_entered(body): #behind
	if not has_flipped:
		player = body
		# Make sure that controlled_object is defined and has a scale property
		if controlled_object:
			controlled_object.scale.x = -controlled_object.scale.x
			has_flipped = true

func _on_chase_to_left_body_exited(body): #behind
	player = null
	#enemy_chase = true
	has_flipped = false

func _on_chase_to_right_body_entered(body): #infront
	emit_signal("interrupt_state", chase_run)
	playback.travel(run_animation_name)
	player = body
	enemy_chase = true
#	if dead_state && dead_animation_name:
#		character.velocity = Vector2.ZERO

func _on_chase_to_right_body_exited(_body): #infront
	emit_signal("interrupt_state", attack_state)
	playback.travel(attack_animation_name)
	player = null
	enemy_chase = false
#	if dead_state && dead_animation_name:
#		character.velocity = Vector2.ZERO

func on_exit():
	character.velocity = Vector2.ZERO

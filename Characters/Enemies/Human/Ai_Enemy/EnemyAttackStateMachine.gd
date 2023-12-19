extends State

class_name EnemyAttackStateMachine

@export var attack_animation_name: String = "attack"

@export var dead_animation_name: String = "dead"
@export var run_animation_name: String = "run"
@export var idle_animation_name: String = "idle"
@export var return_state: State
@export var current_state: State
@export var idle_state: State
@export var attack_state: State
#@export var run_state: State

#@onready var timer: Timer = $AttackAnimTimer
#@onready var animation_tree: AnimationTree = $AnimationTree

func _ready():
	#current_state = 
	#animation_tree.active = true
	#playback.travel(run_animation_name)
#	if (animation_tree == null):
#		print("the current state is null")
	print_debug(current_state)

func _on_player_detector_body_entered(body):
	current_state = attack_state
#	timer.start()
	playback.travel(attack_animation_name)
	print("the enemy is atatcking the player")
	#if (current_state = dead_animation_name):
	


#func _on_animation_player_animation_finished(anim_name):
#	if (anim_name == attack_animation_name):
#		#timer.is_stopped()
#		#playback.travel(idle_animation_name)
#		attack_state = return_state
#		print("the attack aniamtion is done")
#				#next_state = return_state



func _on_player_detector_body_exited(body):
	current_state = return_state
	playback.travel(run_animation_name)
	print_debug(current_state)

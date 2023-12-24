extends State

@export var attack_animation_name: String = "attack"
@export var attack_state: State
@export var idle_animation_name: String = "idle"
@export var current_state: State
@export var idle_state: State
var arrow_scene = preload("res://Characters/Enemies/Human/Ai_Enemy_Level_3/arrow/arrow.tscn")

func _on_player_detector_body_entered(body):
	call_deferred("spawn_arrow")

func spawn_arrow():
	emit_signal("interrupt_state", attack_state)
	playback.travel(attack_animation_name)
	current_state = attack_state


func _on_player_detector_body_exited(body):
	emit_signal("interrupt_state", idle_state)
	playback.travel(idle_animation_name)
	current_state = next_state

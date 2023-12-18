extends Control

class_name Transitions

@export var scene_switch: String = "fade_out"
@export var scene_to_load: PackedScene

@onready var animation_tex: TextureRect = $TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tex.visible = false

func set_next_animation(fading_out):
	if(fading_out):
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")
		


func _on_animation_player_animation_finished(anim_name):
	if(scene_to_load != null && anim_name == scene_switch):
		get_tree().change_scene_to_packed(scene_to_load)
	

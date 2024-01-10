extends Area2D

var damage: int = 20
var speed = 100
#@onready var animation_tree: AnimationTree = $AnimationTree

func _ready():
	set_as_top_level(true)
#	animation_tree.active = true


func _process(delta):
	position += (Vector2.DOWN * speed) * delta
	#emit_signal("position_changed", position)

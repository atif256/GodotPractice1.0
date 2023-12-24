extends Area2D

var damage: int = 20
var speed = 300
@onready var animation_tree: AnimationTree = $AnimationTree

func _ready():
	set_as_top_level(true)
	animation_tree.active = true


func _process(delta):
	position += (Vector2.LEFT * speed) * delta
	#emit_signal("position_changed", position)


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free() # to remove the arrow form the screen

#to create damage

func _on_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			child.hit(damage,Vector2.ZERO)
			queue_free()

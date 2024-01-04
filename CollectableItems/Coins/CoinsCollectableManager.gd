extends Node2D

@export var coins: int = 1 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_detector_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			child.coin(coins)
			queue_free()

extends Node2D

@export var coins: int = 1 
@onready var anim = $CoinsCollectable/AnimationPlayer 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_detector_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			child.coin(coins) #to connect different node using func coin pass to coins
			queue_free()
			const spark = preload("res://CollectableItems/Coins/sparkling_effect.tscn")
			var effect_start = spark.instantiate()
			get_parent().add_child(effect_start)
			effect_start.global_position = $".".global_position



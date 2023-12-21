extends Area2D

@export var damage : int =10 #10 initial
@export var ai_enemy2: Ai_Enemy2
@export var facing_shape: FacingShape2DEnemy2


# Called when the node enters the scene tree for the first time.
func _ready():
	monitoring = false
	ai_enemy2.connect("facing_direction_changed", _on_enemy_facing_direction_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	for child in body.get_children():
		if child is PlayerHealth:
			print("enemy enter the player hit box")
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			var direction_sign = sign(direction_to_damageable.x)
			
			#to check the player is pasing to the left or right
			var player_facing_right = facing_shape.position == facing_shape.facing_right_position
			var knockback_direction = Vector2.RIGHT if player_facing_right else Vector2.LEFT
			
			#apply knockback direction
			if(direction_sign > 0):
				child.hit(damage, knockback_direction)
				#print_debug(child)
			elif(direction_sign < 0):
				child.hit(damage, -knockback_direction)
			else:
				child.hit(damage, Vector2.ZERO)


func _on_enemy_facing_direction_changed(facing_left: bool):
	if(facing_left):
		facing_shape.position = facing_shape.facing_left_position
	else:
		facing_shape.position = facing_shape.facing_right_position

extends Area2D

@export var damage : int =10 #10 initial
@export var enemy_ai: Ai_Enemy
@export var facing_shape: FacingShape2DEnemy1

func _ready():
	pass
	#monitoring = false
	#enemy_ai.connect("facing_direction_changed", _on_enemy_facing_direction_changed)


func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			#get direction from sword to body
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


func _on_enemy_facing_direction_changed(facing_right: bool):
	if(facing_right):
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position

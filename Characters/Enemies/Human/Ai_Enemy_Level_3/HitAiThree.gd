extends State

class_name HitStateAiThree

@export var damageable: DamageableAiThree
@export var dead_state: State
@export var dead_animation_node: String = "dead"

func _ready():
	damageable.connect("on_hit", on_damageable_hit)


func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2):
	if (damageable.health > 0 ):
		emit_signal("interrupt_state", self)
	#else:
	elif (damageable.health <= 0):
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
		print("character is dead")


extends State


@export var damageable: DamageableBee
@export var fly_animation_name: String = "fly"
@onready var animation_tree: AnimationTree = $AnimationTree


func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_damageable_hit(node: Node, damage_amount: int, knockback_direction: Vector2):
	if(damageable.health > 0): #>=
		#character.velocity = knockback_speed  *  knockback_direction
		emit_signal("interrupt_state", self)
		playback.travel(fly_animation_name)
#	else:
#		emit_signal("interrupt_state", dead_state)
#		#playback.travel(dead_animation_node)
	

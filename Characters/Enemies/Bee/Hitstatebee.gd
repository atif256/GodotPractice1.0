extends State


@export var damageable: DamageableBee
@export var fly_animation_name: String = "fly"
@export var dead_state: State
@export var hit_animation_node: String = "hit"
@export var return_state: State

#new addwd
#var hit_animation_duration: float
@onready var disappear_timer: Timer = $Timer

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_damageable_hit(_node: Node, _damage_amount: int, _knockback_direction: Vector2):
	if(damageable.health > 0): #>=
		#character.velocity = knockback_speed  *  knockback_direction
		emit_signal("interrupt_state", self)
		#playback.travel(fly_animation_name)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(hit_animation_node)

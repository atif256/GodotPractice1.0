extends State

@export var damageable: DamageableBoarWhite

@export var knockback_speed: float = 100
@export var dead_state: State
@export var dead_animation_node: String = "dead"
@onready var timerboar : Timer = $Timer

#func _ready():
#	damageable.connect("on_hit", on_damageable_hit)

#func on_enter():
#	timerboar.start()

#func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction: Vector2 ):
#	if(damageable.health > 0):
#		character.velocity = knockback_speed  *  knockback_direction
#		emit_signal("interrupt_state", self)
##		playback.travel(run_animation_name)
##		call_deferred("health_floating")
##	elif (damageable.health == 30):
##		character.Velocity = Vector2.RIGHT
#	else:
#		print("boar is dead")
#		emit_signal("interrupt_state", dead_state)
#		playback.travel(dead_animation_node)

extends Label

@export var state_machine: CharacterStateMachine
@export var health_enemy: DamageableAiOne
#@onready var sprite: Sprite2D = $Sprite2D
#signal facing_direction_changed(facing_right: bool)

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "State : " + state_machine.current_state.name
	text += "\nHealth: " + str(health_enemy.health)
	##scale.x.h_flip = false
#	update_facing_direction()

#func update_facing_direction():
#	emit_signal("facing_direction_changed", !sprite.flip_h)

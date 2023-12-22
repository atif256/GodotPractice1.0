extends Label

@export var state_machine: CharacterStateMachine
@export var health_enemy: DamageableAiTwo
#@onready var sprite: Sprite2D = $Sprite2D
#signal facing_direction_changed(facing_right: bool)

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "State : " + state_machine.current_state.name
	text += "\nHealth: " + str(health_enemy.health)
#	text = "Health: " + str(health_enemy.health)

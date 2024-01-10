extends Label

@export var state_machine: CharacterStateMachine
@export var health_enemy: DamageableAiTwo

func _ready():
	pass

func _process(_delta):
	text = "State : " + state_machine.current_state.name
	text += "\nHealth: " + str(health_enemy.health)


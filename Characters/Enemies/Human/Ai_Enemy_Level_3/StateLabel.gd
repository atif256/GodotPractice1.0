extends Label

@export var state_machine: CharacterStateMachine
@export var health_enemy: DamageableAiThree

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "State : " + state_machine.current_state.name
	text += "\nHealth: " + str(health_enemy.health)

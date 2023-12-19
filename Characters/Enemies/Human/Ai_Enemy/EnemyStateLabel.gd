extends Label

@export var state_machine: CharacterStateMachine

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "State : " + state_machine.current_state.name
	##scale.x.h_flip = false

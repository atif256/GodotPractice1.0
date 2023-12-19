extends Node2D

@export var state_machine: CharacterStateMachine
@export var health_enemy: DamageableAiOne
@export var label_node: Label  # Reference to the Label node

func _ready():
	pass
	# Instantiate and add the Label node as a child
	label_node = Label.new()
	label_node.text = "State: "
	add_child(label_node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	# Update the Label text with state and health information
	label_node.text = "State: " + state_machine.current_state.name
	label_node.text += "\nHealth: " + str(health_enemy.health)

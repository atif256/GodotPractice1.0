extends CheckButton


@export var transitioner: Transitions



func _on_toggled(button_pressed):
	transitioner.set_next_animation(button_pressed)

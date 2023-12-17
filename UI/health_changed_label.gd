extends Label

@export var float_speed : Vector2 = Vector2(0, -10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += float_speed * delta

func start_floating():
	$Timer.start()

func _on_timer_timeout():
	queue_free()

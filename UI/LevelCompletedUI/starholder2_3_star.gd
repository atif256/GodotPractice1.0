extends GridContainer

#for level1
func _ready():
	Engine.time_scale = 1
	StarAnim1_visible()
	StarAnim2_visible()
	StarAnim3_visible()

func StarAnim1_visible():
	if StarholderBus.star_visibility4:
		$StarAnim1.visible = true
	else:
		$StarAnim1.visible = false

func StarAnim2_visible():
	if StarholderBus.star_visibility5:
		$StarAnim2.visible = true
	else:
		$StarAnim2.visible = false

func StarAnim3_visible():
	if StarholderBus.star_visibility6:
		$StarAnim3.visible = true
	else:
		$StarAnim3.visible = false


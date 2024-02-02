extends GridContainer



# somehow need to connect to chest open
var star_visibility1 = false # for Chest
var star_visibility2 = false # for Chest2
var star_visibility3 = false #for Chest3


func _ready():
#	collect_chest_1()
#	collect_chest_2()
#	collect_chest_3()
	load_star()
#	pass

#func collect_chest_1():
#	if star_visibility1:
#		$StarAnim1.visible = true
#	else:
#		$StarAnim1.visible = false
#
#func collect_chest_2():
#	if star_visibility2:
#		$StarAnim2.visible = true
#	else:
#		$StarAnim2.visible = false
#
#func collect_chest_3(): # not yet done
#	if star_visibility3:
#		$StarAnim3.visible = true
#	else:
#		$StarAnim3.visible = false

func save_star():
	var config = ConfigFile.new()
	
	config.set_value("Stars", "star_visibility1", star_visibility1)
	config.set_value("Stars", "star_visibility2", star_visibility2)
	config.set_value("Stars", "star_visibility3", star_visibility3)
	
	config.save("user://star_data.cfg")

func load_star():
	var config = ConfigFile.new()
	
	if config.load("user://star_data.cfg") == OK:
		star_visibility1 = config.get_value("Stars", "star_visibility1", false)
		star_visibility2 = config.get_value("Stars", "star_visibility2", false)
		star_visibility3 = config.get_value("Stars", "star_visibility3", false)

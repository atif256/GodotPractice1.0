extends GridContainer

#StarholderBus this is autoload gd

# level 1
var star_visibility1 = false # for Chest
var star_visibility2 = false # for Chest2
var star_visibility3 = false #for Chest3

# level 2
var star_visibility4 = false # for Chest
var star_visibility5 = false # for Chest2
var star_visibility6 = false #for Chest3


func _ready():
	load_star()


func save_star():
	var config = ConfigFile.new()
	#for level 1
	config.set_value("Stars", "star_visibility1", star_visibility1)
	config.set_value("Stars", "star_visibility2", star_visibility2)
	config.set_value("Stars", "star_visibility3", star_visibility3)
	
	#for level 2
	config.set_value("Stars", "star_visibility4", star_visibility4)
	config.set_value("Stars", "star_visibility5", star_visibility5)
	config.set_value("Stars", "star_visibility6", star_visibility6)
	
	config.save("user://star_data.cfg")

func load_star():
	var config = ConfigFile.new()
	
	if config.load("user://star_data.cfg") == OK:
		star_visibility1 = config.get_value("Stars", "star_visibility1", false)
		star_visibility2 = config.get_value("Stars", "star_visibility2", false)
		star_visibility3 = config.get_value("Stars", "star_visibility3", false)
		
		#level 2
		star_visibility4 = config.get_value("Stars", "star_visibility4", false)
		star_visibility5 = config.get_value("Stars", "star_visibility5", false)
		star_visibility6 = config.get_value("Stars", "star_visibility6", false)

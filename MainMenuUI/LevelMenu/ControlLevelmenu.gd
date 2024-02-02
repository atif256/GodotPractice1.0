extends Control #this is gd from level menu and already autoload it named as ControlLevelMenu

@export var tutorial_level: PackedScene
@export var level_one: PackedScene
@export var level_two: PackedScene
@export var level_three: PackedScene
@export var level_four: PackedScene

@export var level0: bool = true
@export var level1: bool = false
@export var level2: bool = false
@export var level3: bool = false
@export var level4: bool = false
@export var level5: bool = false

#this is for Starholder1
#@export var star_one: bool = false
#@export var star_two: bool = false
#@export var star_three: bool = false

#@onready var star_anim_1 = get_node("Starholder1/StarAnim1")
#@onready var star_anim_2 = get_node("Starholder1/StarAnim2")
#@onready var star_anim_3 = get_node("Starholder1/StarAnim3")

#@onready var star_anim_1: Panel = $Starholder1/StarAnim1
#@onready var star_anim_2: Panel = $Starholder1/StarAnim2
#@onready var star_anim_3: Panel = $Starholder1/StarAnim3

#@onready var star_anim_1 = get_parent().find_child("StarAnim1")
#@onready var star_anim_2 = get_parent().find_child("Starholder1/StarAnim2")
#@onready var star_anim_3 = get_parent().find_child("Starholder1/StarAnim2")

#@onready var starholder = %Starholder1
func _ready():
#	print(starholder)
	load_saved_data()

#this is level0 and is always unlocked
func _on_tutorial_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_packed(tutorial_level)

func _on_level_1_pressed():
	if level1:
		$ButtonClick.play()
		await $ButtonClick.finished
		get_tree().change_scene_to_packed(level_one)
	else:
		$Locked.visible = true
		$ButtonClick.play()
		await $ButtonClick.finished
		$Locked.visible = false


func _on_level_2_pressed():
	if level2:
		$ButtonClick.play()
		await $ButtonClick.finished
		get_tree().change_scene_to_packed(level_two)
	else:
		$Locked.visible = true
		$ButtonClick.play()
		await $ButtonClick.finished
		$Locked.visible = false

func _on_level_3_pressed():
	if level3:
		$ButtonClick.play()
		await $ButtonClick.finished
		get_tree().change_scene_to_packed(level_three)
	else:
		$Locked.visible = true
		$ButtonClick.play()
		await $ButtonClick.finished
		$Locked.visible = false

func _on_level_4_pressed():
	if level4:
		$ButtonClick.play()
		await $ButtonClick.finished
		get_tree().change_scene_to_packed(level_four)
	else:
		$Locked.visible = true
		$ButtonClick.play()
		await $ButtonClick.finished
		$Locked.visible = false
#	get_tree().change_scene_to_packed(level_four)

#new back button design
func _on_back_pressed():
	$ButtonClick.play()
	await $ButtonClick.finished
	get_tree().change_scene_to_file("res://MainMenuUI/MainMenu/main_menu.tscn")

#saving level data
func save_data():
	var config = ConfigFile.new()
	
	for i in range(1,5): #level1,level2,level3 and level4
		var level_name = "level" + str(i)
		config.set_value("Game", level_name, get(level_name))
	config.save("user://saved_data.cfg")

#to load current saving
func load_saved_data():
	var config = ConfigFile.new()
	if config.load("user://saved_data.cfg") == OK:
		for i in range(1, 5):
			var level_name = "level" + str(i)
			var value = config.get_value("Game", level_name, get(level_name))
			set(level_name, value)
	else:
		print("your system is failed to load a data")


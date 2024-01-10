extends State #ground is a child of state machine a child of player

class_name GroundState

@export var jump_velocity : float = -150.0
@export var air_state : State
@export var jump_animation : String = "jump"
@export var attack_state: State
@export var attack_node: String = "attack1"
@onready var buffer_timer: Timer = $BufferTimer #0.05 oneshot and autostart on
@export var attack_delay: float = 0.15  # Adjust the delay time

var attack_stamina_bar: TextureProgressBar = null
var max_stamina: float = 100.0
var current_stamina: float = max_stamina
var stamina_recovery_rate: float = 20.0  # Adjust the recovery rate #25 too fast
var is_attacking: bool = false



func _ready():
	buffer_timer.wait_time = attack_delay
	buffer_timer.one_shot = true
	attack_stamina_bar = get_node("../../../PlayerHealthBarUI/AttackCooldownBar")
	update_stamina_bar()

func state_process(_delta):
	if(!character.is_on_floor() && buffer_timer.is_stopped()):
		next_state = air_state
		
	#implement satmia recovery
	if (current_stamina < max_stamina):
		current_stamina += stamina_recovery_rate * _delta
		update_stamina_bar()
	if (is_attacking && current_stamina <=0):
		is_attacking = false
		buffer_timer.stop()
		

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
		
		
	if(event.is_action_pressed("attack") && buffer_timer.is_stopped()):
		attack()
		

func jump():
	character.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)
	$"../../Jump1SFX".play()
	update_stamina_bar()

func attack():
	if current_stamina >= 20:
		next_state=attack_state
		playback.travel(attack_node)
		buffer_timer.start()
		current_stamina -=20
		is_attacking = true
		$"../../SwordSFX".play()
		update_stamina_bar()

func update_stamina_bar():
	if attack_stamina_bar:
		attack_stamina_bar.value = current_stamina

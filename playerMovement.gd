extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(int) var WALK_SPEED = 200
var velocity = Vector2()
onready var ANI = get_node("HeroSprite")
enum HERO_STATE {
	down_walking,
	up_walking,
	left_walking,
	right_walking,
	down_stand,
	up_stand,
	left_stand,
	right_stand,
	nodding,
	laughing,
	shaking
}

var HERO_STATE_STRINGS = [
	"down_walking",
	"up_walking",
	"left_walking",
	"right_walking",
	"down_stand",
	"up_stand",
	"left_stand",
	"right_stand",
	"nodding",
	"laughing",
	"shaking"
	
]

var state = HERO_STATE.down_stand
var previousState = HERO_STATE.down_stand

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass


func _fixed_process(delta):
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
		previousState = state
		state = HERO_STATE.left_walking
	elif (Input.is_action_pressed("ui_right")):
		velocity.x =  WALK_SPEED
		previousState = state
		state = HERO_STATE.right_walking
	else:
		velocity.x = 0

	if (Input.is_action_pressed("ui_up")):
		velocity.y = -WALK_SPEED
		previousState = state
		state = HERO_STATE.up_walking
		
	elif (Input.is_action_pressed("ui_down")):
		velocity.y =  WALK_SPEED
		previousState = state
		state = HERO_STATE.down_walking
	else:
		velocity.y = 0
		

	if(velocity.x == 0 && velocity.y == 0):
		if(previousState == HERO_STATE.up_walking):
			state = HERO_STATE.up_stand
		if(previousState == HERO_STATE.down_walking):
			state = HERO_STATE.down_stand
		if(previousState == HERO_STATE.left_walking):
			state = HERO_STATE.left_stand
		if(previousState == HERO_STATE.right_walking):
			state = HERO_STATE.right_stand
	var motion = velocity * delta
	move(motion)
	ANI.play(HERO_STATE_STRINGS[state])

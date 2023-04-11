extends Area2D

signal hit

@export var speed = 400
var direction = 0
var velocity = Vector2.ZERO
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	keyboardControls(delta)

# Contiunos movement with no stop
func keyboardControls(delta):
	if(Input.is_action_pressed("arcade_up")):
		velocity.x = 0
		velocity.y = -1
	if(Input.is_action_pressed("arcade_down")):
		velocity.x = 0
		velocity.y = 1
	if(Input.is_action_pressed("arcade_left")):
		velocity.x = -1
		velocity.y = 0
	if(Input.is_action_pressed("arcade_right")):
		velocity.x = 1
		velocity.y = 0
	
	if(velocity.length() > 0):
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position.y = clamp(position.y, 0, screen_size.y)
	position.x = clamp(position.x, 0, screen_size.x)

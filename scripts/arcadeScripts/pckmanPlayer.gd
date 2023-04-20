extends CharacterBody2D

signal hit
signal pointsChanged(points)

var points = 0
@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	keyboardControls(delta)

# Contiunos movement with no stop
# Note, try to avoid using this many raycast rays although it probably doesnt affect performance for this too much
func keyboardControls(delta):
	if(Input.is_action_pressed("arcade_up") and !$RayCasting/RayUpLeft.is_colliding() and !$RayCasting/RayUpRight.is_colliding()):
		velocity.x = 0
		velocity.y = -1
		$AnimatedSprite2D.play("upMove")
	if(Input.is_action_pressed("arcade_down") and !$RayCasting/RayDownLeft.is_colliding() and !$RayCasting/RayDownRight.is_colliding()):
		velocity.x = 0
		velocity.y = 1
		$AnimatedSprite2D.play("downMove")
	if(Input.is_action_pressed("arcade_left") and !$RayCasting/RayLeftUp.is_colliding() and !$RayCasting/RayLeftDown.is_colliding()):
		velocity.x = -1
		velocity.y = 0
		$AnimatedSprite2D.play("sideMove")
		$AnimatedSprite2D.flip_h = true
	if(Input.is_action_pressed("arcade_right") and !$RayCasting/RayRightUp.is_colliding() and !$RayCasting/RayRightDown.is_colliding()):
		velocity.x = 1
		velocity.y = 0
		$AnimatedSprite2D.play("sideMove")
		$AnimatedSprite2D.flip_h = false
	
	if(velocity.length() > 0):
		velocity = velocity.normalized() * speed
		velocity = velocity * delta * 100
	
	move_and_slide()
	position.y = clamp(position.y, 0, screen_size.y)
	position.x = clamp(position.x, 0, screen_size.x)

func addPoints(newPoints):
	points += newPoints
	emit_signal("pointsChanged", points)

func start(startPos):
	position = startPos

extends CharacterBody2D

var speed = 300

var target = Vector2(60.0,180.0)

@onready var nav_agent = $NavigationAgent2D

func _ready():
	call_deferred("actor_setup")

func actor_setup():
	await get_tree().physics_frame
	
	nav_agent.target_position = target
	
func set_target(newTarget):
	target = newTarget
	actor_setup()


func _physics_process(delta):
	if nav_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_transform.origin
	var next_path_position: Vector2 = nav_agent.get_next_path_position()

	var new_velocity: Vector2 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * speed

	set_velocity(new_velocity)

	move_and_slide()

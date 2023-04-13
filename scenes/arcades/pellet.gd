extends Node2D

@export var points = 10

func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		body.addPoints(points)
		queue_free()

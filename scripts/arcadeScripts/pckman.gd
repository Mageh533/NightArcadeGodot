extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($StartPosition.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Teleports any body that reaches the teleporter to the other side of the maze

func _on_teleporter_left_body_entered(body):
	body.position = $Teleporters/ExitPosRight.position


func _on_teleporter_right_body_entered(body):
	body.position = $Teleporters/ExitPosLeft.position

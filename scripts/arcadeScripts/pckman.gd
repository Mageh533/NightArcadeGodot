extends Node2D

var level = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($StartPosition.position)

func _process(delta):
	$Ghost1.set_target($Player.position)

# Teleports any body that reaches the teleporter to the other side of the maze

func _on_teleporter_left_body_entered(body):
	body.position = $Teleporters/ExitPosRight.position


func _on_teleporter_right_body_entered(body):
	body.position = $Teleporters/ExitPosLeft.position


func _on_player_points_changed(points):
	if(points < 100):
		$UI/ScoreLabel.text = "Score: " + "0000" + str(points)
	elif(points < 1000):
		$UI/ScoreLabel.text = "Score: " + "000" + str(points)
	elif(points < 10000):
		$UI/ScoreLabel.text = "Score: " + "00" + str(points)
	elif(points < 100000):
		$UI/ScoreLabel.text = "Score: " + "0" + str(points)
	else:
		$UI/ScoreLabel.text = "Score: " + str(points)

extends Node2D

var level = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($StartPosition.position)

func _process(_delta):
	$Ghost1.set_target($Player.position)

# Teleports any body that reaches the teleporter to the other side of the maze

func _on_teleporter_left_body_entered(body):
	body.position = $Teleporters/ExitPosRight.position


func _on_teleporter_right_body_entered(body):
	body.position = $Teleporters/ExitPosLeft.position


func _on_player_points_changed(points):
	var acceptedLength = 8 - str(points).length()
	var emptyZeroes = ""
	
	while(emptyZeroes.length() < acceptedLength):
		emptyZeroes += "0"
	
	$UI/ScoreLabel.text = emptyZeroes + str(points)


func _on_player_hit():
	get_tree().paused = true

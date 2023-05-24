extends Node2D

var level = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($StartPosition.position)
	$Player.visible = false
	$Ghosts.visible = false
	get_tree().paused = true

func _process(_delta):
	$Ghosts/Ghost1.set_target($Player.position)

# Teleports any body that reaches the teleporter to the other side of the maze

func levelComplete():
	$NextRoundTimer.start()
	get_tree().paused = true

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


func _on_round_start_timer_timeout():
	$UI/GameStartLabel.visible = false
	get_tree().paused = false


func _on_round_start_timer_visibles_timeout():
	$Player.visible = true
	$Ghosts.visible = true


func _on_next_round_timer_timeout():
	$Ghosts.visible = false

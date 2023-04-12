extends ColorRect

signal colorChanged(newColor)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if(color == Color("GREEN")):
		color = Color("RED")
	elif(color == Color("RED")):
		color = Color("PURPLE")
	else:
		color = Color("GREEN")
	emit_signal("colorChanged", color)

extends Node2D
func _process(_delta:float):
	if Input.is_action_just_pressed("SLOWTIME"):
		Engine.time_scale=0.5
	else:
		Engine.time_scale=1

extends CharacterBody2D
var player=
func _physics_process(delta):
	var direction=global_position.x.direction_to(player.global_position.x)
	velocity=direction*300.0
	

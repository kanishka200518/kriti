extends Area2D


@onready var timer: Timer = $Timer
var inside=false
var p
func _on_body_entered(_body):
	if _body.has_method("take_damage"):
		p=_body
		print("You died!")
		inside=true

func _process(delta: float) :
	if inside:
		p.health-=delta*10
		if p.health<=0:
			get_tree().reload_current_scene()
		




func _on_body_exited(_body: Node2D) :
	if _body==p:
		inside=false

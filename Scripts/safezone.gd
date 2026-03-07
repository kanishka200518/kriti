extends Area2D
@onready var player: CharacterBody2D = $"../player"


	


func _on_body_entered(_body: Node2D) -> void:
	if _body==player :

		_body.collision_layer=8

func _on_body_exited(_body: Node2D) -> void:
	if _body==player:

		_body.collision_layer=4

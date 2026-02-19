extends Area2D
@onready var game: Node2D = $"../.."

var enemy_near=false
var enemy
var can_damage
func _on_body_entered(_body: Node2D) -> void:
	enemy_near=true
	enemy=_body
	can_damage=enemy.has_method("take_damage")
func _physics_process(_delta: float):
	if can_damage and Input.is_action_just_pressed("sword") and enemy_near:
		enemy.take_damage(30)




func _on_body_exited(_body: Node2D) -> void:
	enemy_near=false

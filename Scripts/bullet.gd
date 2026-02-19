extends Area2D

# --- SETTINGS ---
var direction : Vector2 = Vector2.RIGHT
var speed : float = 300
# REMOVED: var max_rewind_seconds (We don't limit it anymore)

# --- REWIND DATA ---
var history : Array = []
var is_rewinding : bool = false

func _physics_process(delta):
	if Input.is_key_pressed(KEY_R):
		is_rewinding = true
		rewind_movement()
	else:
		is_rewinding = false
		normal_movement(delta)

func normal_movement(delta):
	# 1. Move normally
	position += direction * speed * delta
	
	# 2. Record position
	history.append(position)
	
	# REMOVED: The code that deletes old history (pop_front)
	# Now the bullet remembers its entire life, all the way back to the gun.

func rewind_movement():
	# 1. Go back one step
	if history.size() > 0:
		position = history.pop_back()
	
	# 2. If history hits 0, it means we are back at the gun
	else:
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	# Only delete if we are NOT rewinding
	if not is_rewinding:
		queue_free()


func _on_body_entered(_body: Node2D) -> void:
	if _body.has_method("take_damage"):

		_body.take_damage(30)

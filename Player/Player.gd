extends CharacterBody2D

const SPEED = 300.0

func getDirection():
	return Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

func _physics_process(delta):
	velocity = getDirection() * SPEED
	move_and_slide()

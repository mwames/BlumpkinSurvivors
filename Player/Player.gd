extends CharacterBody2D

const SPEED = 300.0
const Projectile = preload("res://Projectiles/Projectile.tscn")

var heading = Vector2(-1, 0)

func getDirection():
	return Vector2(
		Input.get_axis("Walk Left", "Walk Right"),
		Input.get_axis("Walk Up", "Walk Down")
	)

func _physics_process(delta):
	velocity = getDirection() * SPEED
	move_and_slide()
	
func fire(pos: Vector2, heading: Vector2, parent: Node2D) -> void:
	var instance: Node2D = Projectile.instantiate()
	instance.construct(Vector2(pos.x, pos.y), heading, SPEED)
	parent.add_child(instance)
	
func _process(_delta):
	if Input.is_action_just_pressed("Attack"):
		fire(position, heading, get_parent())
	if Input.is_action_pressed("Walk Left"):
		$CollisionShape2D/Character/PlayerUpper.set("flip_h", false)
		$CollisionShape2D/Character/PlayerLower.set("flip_h", false)
		heading = Vector2(-1, 0)
	if Input.is_action_pressed("Walk Right"):
		$CollisionShape2D/Character/PlayerUpper.set("flip_h", true)
		$CollisionShape2D/Character/PlayerLower.set("flip_h", true)
		heading = Vector2(1, 0)

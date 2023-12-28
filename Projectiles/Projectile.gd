extends CharacterBody2D

const BASE_SPEED = 10.0
var speed = 0
var heading = -1
@onready var animation_player = $HitBox/Sprite2D/AnimationPlayer

func _physics_process(_delta):
	velocity.x = (BASE_SPEED + speed) * heading
	move_and_slide()

func construct(pos: Vector2, head: Vector2, s: float):
	position = pos + Vector2(head.x * 20, 0)
	heading = head.x
	speed = s
	
func _ready():
	animation_player.play("rotate")

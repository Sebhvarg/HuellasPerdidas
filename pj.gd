extends CharacterBody2D

@onready var animats = $AnimatedSprite2D
@export var speed: float = 150.0  # Velocidad del personaje
		
func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		animats.play("right")
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		animats.play("Left")
	elif Input.is_action_pressed("ui_down"):
		direction.y +=1
		animats.play("Idle")
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		animats.play("up")
	else:
		animats.play("Idle")


	velocity = direction * speed
	move_and_slide()

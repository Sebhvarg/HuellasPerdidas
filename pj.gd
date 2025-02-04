extends CharacterBody2D

@onready var animats = $AnimatedSprite2D
@export var speed: float = 150.0  # Velocidad del personaje
var dialogo_npc_contador = 0  # Contador para cambiar diálogos
var dialogo_fantasmin_contador = 0  
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
func _on_area_2d_body_entered(body: Node2D) -> void:
	if dialogo_npc_contador == 0:
		Dialogic.start("DialogNPC")  # Primer diálogo
	elif dialogo_npc_contador == 1:
		Dialogic.start("Dialogosmostrados")  # Segundo diálogo
	dialogo_npc_contador += 1  # Aumenta el contador


func _on_fantasmin_body_entered(body: Node2D) -> void:
	Dialogic.start("DialogPHT")
	pass # Replace with function body.


func _on_cofre_body_entered(body: Node2D) -> void:
	Dialogic.start("DialogCHT")
	pass # Replace with function body.

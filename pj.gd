extends CharacterBody2D

@onready var animats = $AnimatedSprite2D
@export var speed: float = 150.0  # Velocidad del personaje
@onready var skeleton_off = $"../CanvasLayer/Keys/Skeletonon"
@onready var celtic_off = $"../CanvasLayer/Keys/Celticon"
@onready var dove_off = $"../CanvasLayer/Keys/Doveon"
@onready var puertaiz_abierta = $"../Scenary/Puertaabierta3"
@onready var puertader_abierta = $"../Scenary/Puertaabierta4"
@onready var puertaiz_cerrada = $"../Scenary/Puertacerrada3"
@onready var puertader_cerrada = $"../Scenary/Puertacerrada4"

var llaves
var dialogo_cofre = false  # Para el diálogo del Fantasmin
var dialogo_inicio = false
var llave_dove = 0
var llave_celtic = 0
var llave_skeleton = 0
func _ready():
	if not dialogo_inicio:
		Dialogic.start("Inicio")
		dialogo_inicio = true
	pass # Replace with functi
	Dialogic.signal_event.connect(DialogicSignal)
	pass
	
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
	if llave_celtic == 1:
		Dialogic.start("Dialogosmostrados")
	else:
		Dialogic.start("DialogNPC")
	pass # Replace with function body.


func _on_fantasmin_body_entered(body: Node2D) -> void:
	if llave_skeleton == 1:
		Dialogic.start("Dialogosmostrados")
	else:
		Dialogic.start("DialogPHT")
	pass # Replace with function body.


func _on_cofre_body_entered(body: Node2D) -> void:
	if not dialogo_cofre:
		Dialogic.start("DialogCHT")
		dialogo_cofre = true
	pass # Replace with function body.
	
func DialogicSignal(argument:String):
	if argument == "celtic_get":
		llave_celtic = 1
		celtic_off.visible = true
	pass
	if argument == "dove_get":
		llave_dove = 1
		dove_off.visible = true
	pass
	if argument == "skeleton_get":
		llave_skeleton = 1
		skeleton_off.visible = true
	pass
	llaves = llave_dove + llave_celtic + llave_skeleton

func _on_puertaarea_body_entered(body: Node2D) -> void:
	if llaves == 3:
		$"../Scenary/puertas".collision_layer = 0
		$"../Scenary/puertas".collision_mask = 0
		puertader_cerrada.visible = false
		puertaiz_cerrada.visible = false
	pass # Replace with function body.
	


func _on_perroaparece_body_entered(body: Node2D) -> void:
	if body.name == $".".name:
		$"../Messi".mostrar_perro()
	Dialogic.start("fintimeline")

extends CharacterBody2D

var speed = 150
@onready var animations = $Animatod
@export var distancia_minima: float = 30.0
@onready var jugador = null
var idle_repetido = false
func _ready():
	var jugadores = get_tree().get_nodes_in_group("PJS")
	$".".visible = false
	if jugadores.size() > 0:
		jugador = jugadores[0]

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if jugador == null:
		return
	var distancia = global_position.distance_to(jugador.global_position)
	if distancia > distancia_minima:  # Solo se mueve si está más lejos de la distancia mínima
		var direccion = (jugador.global_position - global_position).normalized()
		reproducir_animacion_movimiento(direccion)
		idle_repetido = false  
		velocity = direccion * speed
	else:
		velocity = Vector2.ZERO  
		reproducir_animacion_idle()
		
	move_and_slide()
func reproducir_animacion_movimiento(direccion: Vector2):
	if abs(direccion.x) > abs(direccion.y):  # Movimiento horizontal
		if direccion.x > 0:
			animations.play("Derecha")
		else:
			animations.play("Izquierda")
	else:  # Movimiento vertical
		if direccion.y > 0:
			animations.play("Abajo")
		else:
			animations.play("Arriba")
			
func reproducir_animacion_idle():
	if not idle_repetido:
		animations.play("Idle")
		await animations.animation_finished  # Espera que "Idle" termine
		idle_repetido = true  # Marca que ya se reprodujo una vez
		
	animations.play("Idle 2")  # Luego, siempre reproduce "Idle 2"

func mostrar_perro():
	$".".visible = true

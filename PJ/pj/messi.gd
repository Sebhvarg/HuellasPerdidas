extends CharacterBody2D

@export var velocidad: float = 100.0  # Velocidad del perro
@onready var jugador = get_node("../PJ")  # Ruta del jugador

@export var distancia_minima: float = 50.0  # Distancia mínima antes de dejar de moverse


func _physics_process(delta):
	if jugador:
		var distancia = global_position.distance_to(jugador.global_position)

		if distancia > distancia_minima:  # Solo se mueve si está demasiado lejos
			var direccion = (jugador.global_position - global_position).normalized()
			velocity = direccion * velocidad
		else:
			velocity = Vector2.ZERO  # Se queda quieto si está a la distancia correcta

		move_and_slide()

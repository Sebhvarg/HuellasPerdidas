extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureRect/AnimationPlayer.play("inicio")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://test1/game_pil.tscn")


func salir_btn() -> void:
	get_tree().quit()
	

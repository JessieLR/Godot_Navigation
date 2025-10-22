extends Node2D
@onready var click_player: CharacterBody2D = $ClickPlayer

signal setPosition(position: Vector2)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			setPosition.emit(get_global_mouse_position())

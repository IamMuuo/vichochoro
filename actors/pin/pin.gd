class_name  Pin
extends Node2D

@onready var sprite = $sprite
signal position_signal(new_position: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func  _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if event.is_action_pressed("pin"):
			position = event.position
			sprite.visible = true
			emit_signal("position_signal", position)

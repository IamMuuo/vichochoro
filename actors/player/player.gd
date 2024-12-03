extends CharacterBody2D


@export var pin: Pin
const SPEED = 300.0
const POSITION_THRESHHOLD = 3.0
var target_position: Vector2 = Vector2.ZERO 

func _ready():
	# Connect the signal to a method
	pin.connect("position_signal",  _on_position_signal)
	pin.position = position


func _physics_process(delta: float) -> void:
	move_towards_pin(delta)

func _on_position_signal(position: Vector2):
	print("Received position: ", position)
	target_position = position



func move_towards_pin(delta: float) -> void:
	if position.distance_to(target_position) > POSITION_THRESHHOLD:
		var direction = (target_position - position).normalized()
		velocity = direction * SPEED
		look_at(target_position)
		move_and_slide()
	else:
		pass

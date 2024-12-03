class_name Player
extends CharacterBody2D

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

@export var pin: Pin
const SPEED = 300.0
const POSITION_THRESHHOLD = 3.0
var target_position: Vector2 = Vector2.ZERO 

func _ready():
	# Connect the signal to a method
	pin.connect("position_signal",  _on_position_signal)
	#pin.position = position
	
	call_deferred("player_setup")
	

func player_setup():
	await get_tree().physics_frame
	navigation_agent.target_position = pin.global_position

func _physics_process(delta: float) -> void:
	move_towards_pin(delta)

func _on_position_signal(position: Vector2):
	print("Received position: ", position)
	target_position = position
	navigation_agent.target_position = pin.global_position


func move_towards_pin(delta: float) -> void:
	if get_parent() is PathFinderWorld:
		if  navigation_agent.is_navigation_finished():
			return
		else:
			var current_agent_position = global_position
			var next_path_position = navigation_agent.get_next_path_position()
			look_at(next_path_position)
			velocity = current_agent_position.direction_to(next_path_position) * SPEED
			move_and_slide()
			return
	if position.distance_to(target_position) > POSITION_THRESHHOLD:
		var direction = (target_position - position).normalized()
		velocity = direction * SPEED
		look_at(target_position)
		move_and_slide()
	else:
		pass

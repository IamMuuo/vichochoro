extends Area2D

@onready var acceptDialog : AcceptDialog = $AcceptDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	acceptDialog.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_entered(body: Node2D) -> void:
	if body is Player:
		acceptDialog.visible = true
		print("You have reached the destination")
		

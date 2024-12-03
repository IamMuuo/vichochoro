extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_movement_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/simple.tscn")


func _on_btn_exit_pressed() -> void:
	get_tree().quit()


func _on_btn_collision_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/collision.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/path.tscn")

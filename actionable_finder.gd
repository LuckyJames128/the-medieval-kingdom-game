extends Area2D

var can_move = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_state_dialogue_started() -> void:
	print("start")
	can_move = false

func _on_state_dialogue_ended() -> void:
	print("stop")
	can_move = true

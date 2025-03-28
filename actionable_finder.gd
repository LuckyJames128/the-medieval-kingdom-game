extends Area2D

var can_move = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("dialogue"):
		var actionables = get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			can_move = false
			return


func _on_state_dialogue_started() -> void:
	print("start")
	can_move = false

func _on_state_dialogue_ended() -> void:
	print("stop")
	can_move = true

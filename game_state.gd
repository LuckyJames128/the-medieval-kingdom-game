extends Node

signal dialogue_start()
signal dialogue_end()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_example_balloon_tree_entered() -> void:
	print("started")
	await get_tree().create_timer(1.0).timeout
	$player.paused = true


func _on_example_balloon_tree_exited() -> void:
	print("ended")
	dialogue_end.emit()

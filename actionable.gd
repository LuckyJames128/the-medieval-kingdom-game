extends Area2D
#Fish_Bird: <Area2D#57143199581>
#Fish_1: <Area2D#57227085666>
#Fish_Sus: <Area2D#57310971751>


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)

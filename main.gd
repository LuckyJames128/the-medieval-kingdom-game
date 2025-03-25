extends Node
# Called when the node enters the scene tree for the first time.


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Start"

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)


func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("dialogue"):
		var actionables = $TileMap/player/actionable_finder.get_overlapping_bodies()
		if actionables.size() > 0:
			actionables[0].action()
			return

	$TileMap/NPC_Viking_Leader/AnimatedSprite2D.flip_h = $TileMap/player.position.x < $TileMap/NPC_Viking_Leader.position.x
	
	if $TileMap/player.position.x < $TileMap/NPC_Viking_1.position.x:
		$TileMap/NPC_Viking_1/AnimatedSprite2D.flip_h = true
	else:
		$TileMap/NPC_Viking_1/AnimatedSprite2D.flip_h = false
	
	if $TileMap/player.position.x < $TileMap/NPC_Viking_2.position.x:
		$TileMap/NPC_Viking_2/AnimatedSprite2D.flip_h = true
	else:
		$TileMap/NPC_Viking_2/AnimatedSprite2D.flip_h = false

	if $TileMap/player.position.x < $TileMap/NPC_Viking_3.position.x:
		$TileMap/NPC_Viking_3/AnimatedSprite2D.flip_h = true
	else:
		$TileMap/NPC_Viking_3/AnimatedSprite2D.flip_h = false


	if $TileMap/player.position.x < $TileMap/NPC_Fishing_Leader.position.x:
		$TileMap/NPC_Fishing_Leader/AnimatedSprite2D.flip_h = true
	else:
		$TileMap/NPC_Fishing_Leader/AnimatedSprite2D.flip_h = false

	if $TileMap/player.position.x < $TileMap/NPC_Fishing_1.position.x:
		$TileMap/NPC_Fishing_1/AnimatedSprite2D.flip_h = true
	else:
		$TileMap/NPC_Fishing_1/AnimatedSprite2D.flip_h = false

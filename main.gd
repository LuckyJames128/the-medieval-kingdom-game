extends Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$TileMap/NPC_Viking_Leader/AnimatedSprite2D.flip_h = $TileMap/player.position.x < $TileMap/NPC_Viking_Leader.position.x
	$TileMap/NPC_Viking_1/AnimatedSprite2D.flip_h = $TileMap/player.position.x < $TileMap/NPC_Viking_1.position.x
	$TileMap/NPC_Viking_2/AnimatedSprite2D.flip_h = $TileMap/player.position.x < $TileMap/NPC_Viking_2.position.x
	$TileMap/NPC_Viking_3/AnimatedSprite2D.flip_h = $TileMap/player.position.x < $TileMap/NPC_Viking_3.position.x
	$TileMap/NPC_Fishing_Leader/AnimatedSprite2D.flip_h = $TileMap/player.position.x < $TileMap/NPC_Fishing_Leader.position.x
	$TileMap/NPC_Fishing_1/AnimatedSprite2D.flip_h = $TileMap/player.position.x < $TileMap/NPC_Fishing_1.position.x
	
	

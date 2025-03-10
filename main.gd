extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if $TileMap/player.position.x < $TileMap/leader_viking.position.x:
		$TileMap/leader_viking/AnimatedSprite2D.flip_h = true
	else:
		$TileMap/leader_viking/AnimatedSprite2D.flip_h = false
		
	if $TileMap/player.position.x < $TileMap/VikingNPC1.position.x:
		$TileMap/VikingNPC1/AnimatedSprite2D.flip_h = true
	else:
		$TileMap/VikingNPC1/AnimatedSprite2D.flip_h = false
	
	if $TileMap/player.position.x < $TileMap/VikingNPC2.position.x:
		$TileMap/VikingNPC2/AnimatedSprite2D.flip_h = true
	else:
		$TileMap/VikingNPC2/AnimatedSprite2D.flip_h = false

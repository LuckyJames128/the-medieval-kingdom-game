extends CharacterBody2D

@export var speed = 200
var timer_check = false
var impatient_on = false
@onready var can_move = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Start"

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# if can_move == true:
		var velocity = Vector2.ZERO # The player's movement vector.
		
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1

		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
			$AnimatedSprite2D.play()
			impatient_on = false
			timer_check = false
		else:
			$AnimatedSprite2D.play()
		
		position += velocity * delta
		
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "run_side"
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.flip_h = velocity.x < 0
		elif velocity.y > 0:
			$AnimatedSprite2D.animation = "run_down"
		elif velocity.y < 0:
			$AnimatedSprite2D.animation = "run_up"
		
		if velocity.length() == 0:
			if timer_check == false:
				$idle_timer.start()
				timer_check = true
			
			if impatient_on == false:
				$AnimatedSprite2D.animation = "idle"
				$AnimatedSprite2D.flip_v = false
			
		move_and_slide()
	#else: pass

func _on_idle_timer_timeout():
	$AnimatedSprite2D.animation = "impatient_idle"
	impatient_on = true
	


func _on_game_state_dialogue_start():
	print("start2")
	await get_tree().create_timer(1.0).timeout
	$player.paused = true


func _on_game_state_dialogue_end():
	print("end2")
	$player.paused = false

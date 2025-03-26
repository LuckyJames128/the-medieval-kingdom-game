extends CharacterBody2D

@export var speed = 200
var timer_check = false
var impatient_on = false
var can_move = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	if can_move == true:
		if Input.is_action_pressed("move_right"):
			print("right")
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			print("left")
			velocity.x -= 1
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1
		if Input.is_action_pressed("dialogue"):
			var actionables = $actionable_finder.get_overlapping_areas()
			if actionables.size() > 0:
				actionables[0].action()
				return

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
	if can_move == false:
		print("IM NOT MOVING")
	if can_move == true:
		print("IM MOVING")

func _on_idle_timer_timeout():
	$AnimatedSprite2D.animation = "impatient_idle"
	impatient_on = true
	

func _on_state_dialogue_ended() -> void:
	print("stop")
	can_move = false


func _on_state_dialogue_started() -> void:
	print("start")
	can_move = false

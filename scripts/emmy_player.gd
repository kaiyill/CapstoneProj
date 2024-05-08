extends CharacterBody2D

const speed = 30
var current_dir = "none"

@onready var actionable_finder: Area2D = $Direction/area2d
func _ready():
	pass
	
func player():
	pass


func _physics_process(delta):
	player_movement(delta)
	
	
@warning_ignore("unused_parameter")
func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0	
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed	
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	if Input.is_action_just_pressed("chat"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
		
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		if movement == 1:
			anim.play("right_walk")
		elif movement == 0:
			anim.play("right_idle")
	if dir == "left":
		if movement == 1:
			anim.play("left_walk")
		elif movement == 0:
			anim.play("left_idle")
	if dir == "down":
		if movement == 1:
			anim.play("down_walk")
		elif movement == 0:
			anim.play("down_idle")
	if dir == "up":
		if movement == 1:
			anim.play("up_walk")
		elif movement == 0:
			anim.play("up_idle")


	move_and_slide()

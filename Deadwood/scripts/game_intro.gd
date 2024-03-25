extends Node2D

@onready var camera = $Path2D/PathFollow2D/Camera2D
@onready var car = $Path2D2/PathFollow2D/car

@export var level_name = "game_intro" 

var is_openingcutscene = true
var is_camerafollowing = true
var is_carfollowing = true
var faded = false

@warning_ignore("unused_parameter")
func _physics_process(delta):
	if is_openingcutscene:
		var pathfollower = $Path2D/PathFollow2D
		var carfollower = $Path2D2/PathFollow2D
		
		if is_camerafollowing:
			pathfollower.progress_ratio += 0.002
			carfollower.progress_ratio += 0.0015
		
		if pathfollower.progress_ratio ==1 and faded == false:
			$Menu/AnimationPlayer.play("fade_in")
			faded = true
			 
		
func cutsceneopening():
	camera.enabled = true
	is_camerafollowing = true
	
signal level_changed(level_name)

func _on_play_pressed():
	emit_signal("level_changed", level_name)

extends Node

var next_level = null
@onready var current_level = $GameIntro
@onready var anim = $AnimationPlayer

func _ready():
	current_level.connect("level_changed", handle_level_changed)
	
func handle_level_changed(current_level_name: String):
	var next_level_name: String
	
	match current_level_name:
		"game_intro":
			next_level_name = "campsite"
		"campsite":
			next_level_name = "fiona_first_encounter"
		_:
			return
	var temp = load("res://scenes/" + next_level_name + ".tscn")
	next_level = temp.instantiate()
	#next_level.visible = false
	anim.play("fade_in")
	next_level.connect("level_changed", handle_level_changed)
	call_deferred("add_child",next_level)


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			current_level.queue_free()
			current_level = next_level
			#current_level.layer = 1
			next_level = null
			anim.play("fade_out")

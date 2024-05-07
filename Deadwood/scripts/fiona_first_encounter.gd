extends Node2D

var nextt_level = null
@export var level_name = "fiona_first_encounter"
@onready var anim = $main_fade_animations


func _ready():
	anim.play("fade_in")
	$Music.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_music_finished():
	$Music.play()


func _on_forest_area_transition_body_entered(body):
	if body.has_method("player"):
		nextt_level = "forest"
		anim.play("fade_in")
		

func _on_deadwood_area_transition_body_entered(body):
	if body.has_method("player"):
		nextt_level = "deadwood"
		anim.play("fade_in")


func _on_main_fade_animations_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			match nextt_level:
				"forest":
					get_tree().change_scene_to_file("res://scenes/forest_area.tscn")
				"deadwood":
					get_tree().change_scene_to_file("res://scenes/deadwood.tscn")
					

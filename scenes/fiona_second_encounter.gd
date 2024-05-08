extends Node2D

var nextt_level = null
@export var level_name = "fiona_second_encounter"
@onready var anim = $AnimationPlayer


func _ready():
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


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			get_tree().change_scene_to_file("res://scenes/forest_area.tscn")




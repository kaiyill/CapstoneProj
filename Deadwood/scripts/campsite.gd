extends Node2D

var next_level = null
@export var level_name = "campsite"
@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	


func _on_music_finished():
	$Music.play()
	
func _on_forest_area_transition_body_entered(body):
	if body.has_method("player"):
		anim.play("fade_in")


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			next_level = null
			get_tree().change_scene_to_file("res://scenes/forest_area.tscn")
			#anim.play("fade_out")

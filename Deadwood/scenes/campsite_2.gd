extends Node2D


func _ready():
	$campsite/AnimationPlayer.play("fade_in_2")
	$EmmyAnim.play("emmy_fade")

func _process(_delta):
	pass

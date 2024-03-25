extends Node2D



func _ready():
	$AnimationPlayer.play("fade_in")
	$Music.play()
	$decision_box/VSplitContainer/cam.enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_music_finished():
	$Music.play()



func _on_chest_body_entered(body):
	if body.has_method("player"):
		$CameraReset.start()
		$decision_box.visible = true
		$player/Camera2D.enabled = false
		$decision_box/VSplitContainer/cam.enabled = true
		$decision_box/AnimationPlayer.play("fade_in")
		



func _on_camera_reset_timeout():
	$CameraReset.stop()
	$player/Camera2D.enabled = true
	$decision_box/VSplitContainer/cam.enabled = false

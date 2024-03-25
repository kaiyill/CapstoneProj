extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			$AnimationPlayer.play("timer")
			$Timer.start()
		"timer":
			$AnimationPlayer.play("fade_out")
			$VSplitContainer/HSplitContainer/choice1.disabled = true
			$VSplitContainer/HSplitContainer/choice2.disabled = true
			
func _on_timer_timeout():
	$Countdown.play()
	$Timer.stop()

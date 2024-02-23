extends Node2D

const campsite = preload("res://scenes/campsite.tscn")

func _process(delta):
	pass

func _on_TransitionScreen_transitioned():
	$currentscene.get_child(0).queue_free()
	$currentscene.add_child(campsite.instance())
	


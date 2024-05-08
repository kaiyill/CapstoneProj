extends Node2D

const Balloon = preload("res://dialogue/balloon.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "deadwood_entrance"

func _on_trasition_to_dead_wood_body_entered(body):
	if body.has_method("player"):
		get_tree().change_scene_to_file("res://scenes/fiona_second_encounter.tscn")

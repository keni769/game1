extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

var garlic_collected = 0
var timer_end = false
var finished = false


func _ready() -> void:
	await themed_timer.Timer(20.0)
	
	if not finished:
		timer_end = true


func _process(_delta: float) -> void:

	if garlic_collected == 3 and not finished:
		finished = true
		
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")


	if timer_end and not finished:
		finished = true
		
		Global.minigames_done -= 1
		Global.lives -= 1
		
		get_tree().change_scene_to_file("res://scenes/timer_screen.tscn")


func garlic_collect() -> void:
	garlic_collected += 1


func _on_node_2d_garlic_collected() -> void:
	pass # Replace with function body.

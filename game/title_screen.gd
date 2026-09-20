
extends Node2D

@onready var start_button: Button = $VBoxContainer/startgame
@onready var quit_button: Button = $VBoxContainer/Quit

func _ready() -> void:
	start_button.pressed.connect(start_game)
	quit_button.pressed.connect(quit_game)
	


func start_game() -> void:
	Global.minigames_done = 0
	Global.lives = 5

	get_tree().change_scene_to_file(
		"res://scenes/timer_screen.tscn"
	)


func _on_startgame_pressed() -> void:
	pass # Replace with function body.


func quit_game() -> void:
	get_tree().quit()


func _on_quit_pressed() -> void:
	get_tree().quit()

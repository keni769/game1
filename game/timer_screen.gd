extends Node2D

@onready var garlic_container: HBoxContainer = $GarlicContainer
@onready var garlic: TextureRect = $GarlicContainer/Garlic
@onready var garlic_2: TextureRect = $GarlicContainer/Garlic2
@onready var garlic_3: TextureRect = $GarlicContainer/Garlic3
@onready var garlic_4: TextureRect = $GarlicContainer/Garlic4
@onready var garlic_5: TextureRect = $GarlicContainer/Garlic5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $timer

var time: float = 0.0


func _ready() -> void:
	await Timer(3.0)

	if Global.minigames_done < 3:
		Global.minigames_done += 1
		get_tree().change_scene_to_file(
			"res://scenes/minigame_" + str(Global.minigames_done) + ".tscn"
		)
	else:
		get_tree().change_scene_to_file(
			"res://scenes/title_screen.tscn"
		)


func _process(_delta: float) -> void:
	match Global.lives:
		5:
			garlic.show()
			garlic_2.show()
			garlic_3.show()
			garlic_4.show()
			garlic_5.show()
		4:
			garlic.show()
			garlic_2.show()
			garlic_3.show()
			garlic_4.show()
			garlic_5.hide()
		3:
			garlic.show()
			garlic_2.show()
			garlic_3.show()
			garlic_4.hide()
			garlic_5.hide()
		2:
			garlic.show()
			garlic_2.show()
			garlic_3.hide()
			garlic_4.hide()
			garlic_5.hide()
		1:
			garlic.show()
			garlic_2.hide()
			garlic_3.hide()
			garlic_4.hide()
			garlic_5.hide()
		0:
			garlic.hide()
			garlic_2.hide()
			garlic_3.hide()
			garlic_4.hide()
			garlic_5.hide()
			
	timer.text = "%.1f" % time
	level.text = "Level " + str(Global.minigames_done)


func Timer(start_time: float) -> void:
	time = start_time

	while time > 0.0:
		await wait(0.1)
		time -= 0.1

	time = 0.0


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

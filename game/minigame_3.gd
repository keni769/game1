extends Node2D

const SNAKE = 0
const BLUEBERRY = 1

var bb_pos
var snake_body = [
	Vector2(0, 0),
	Vector2(0, 0),
	Vector2(0, 0)
]

var snake_direction = Vector2(1, 0)
var add_bb = false

func _ready():
	bb_pos = place_bb()
	draw_bb()

func place_bb():
	randomize()
	var x = randi() % 20
	var y = randi() % 20
	return Vector2(x, y)

func draw_bb():
	$snapple.set_cell(0, Vector2i(bb_pos), BLUEBERRY, Vector2i(0, 0))

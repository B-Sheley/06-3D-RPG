extends Node

var timer = 0
var score = 0
var start_timer = false
var targets_gone = false
var end = false

func _physics_process(_delta):
	if targets_gone == true:
		reset()
		var _scene = get_tree().change_scene("res://UI/End_Screen.tscn")

func _ready():
	update_score(0)

func _unhandled_input(_event):
	if Input.is_action_just_pressed("menu"):
		get_tree().quit()

func update_score(s):
	score += s

func update_timer(t):
	timer = t
	
func reset():
	timer = 0
	score = 0
	start_timer = false
	targets_gone = false
	

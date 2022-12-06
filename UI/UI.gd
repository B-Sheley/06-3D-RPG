extends CanvasLayer
var timer_started = false

func _physics_process(_delta):
	if Global.start_timer == true and timer_started == false:
		$Timer.start()
		timer_started = true
	Global.timer = $Timer.time_left
	$Background/Score.text = "Score: " + str(Global.score)
	$Background/Time.text = "Time: " + str(Global.timer)
	
# Called when the node enters the scene tree for the first time

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	Global.update_score(-500)

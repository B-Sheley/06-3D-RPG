extends Spatial


func _physics_process(_delta):
	get_child_count()
	if get_child_count() == 0:
		Global.targets_gone = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends RayCast
onready var Player = get_node_or_null("/root/Game/Player")

func _physics_process(delta):
	if is_colliding():
		Player.target = get_collider()
		var position = get_collision_point()
		$Reticule.global_transform.origin = position
	elif $Reticule.translation != Vector3(0,0,35):
		$Reticule.translation = Vector3(0,0,35)
		Player.target = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

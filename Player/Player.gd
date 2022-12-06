extends KinematicBody
onready var Camera = get_node_or_null("/root/Game/Player/Pivot/Camera")

var velocity = Vector3()
var gravity = -9.8
var speed = .8
var max_speed = 8
var mouse_sensitivity = 0.001
var mouse_range = 1.2
var target = null

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	if not $AnimationPlayer.is_playing():
		$AnimationTree.set("parameters/Idle_Run/blend_amount",speed/max_speed)
		$AnimationTree.active = true
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
	if Input.is_action_just_pressed("shoot") and target != null and target.is_in_group("Target"):
		$AnimationTree.active = false
		$AnimationPlayer.play("Shoot")
		target.die()
	
func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$Pivot/Camera.current = true


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)

func damage():
	Global.update_score(-5)
	

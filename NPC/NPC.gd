extends KinematicBody

onready var Dialogue = get_node_or_null("/root/Game/UI/Dialogue")
# Declare member variables here. Examples:
# var a = 2
var dialogue = [
	"So you want to join the association kid?",
	"Well if you want to join ya gonna have ta prove yaself kid.",
	"All potential recruits need to take this test.",
	"We will set up targets. Shoot dem down ya earn points.",
	"But you will be timed. Our time is precious kid, we don't have all day.",
	"Also to add to the challenge we will have survellience drones deployed.",
	"They wont bite, but if ya get yaself caught in their sights you will have points deducted.",
	"Don't wanna lose points kid? Either shoot them down, avoid them, or deal with it.",
	"Though if you do go the shooting down route, each drone you shoot down will earn yaself extra points",
	"If ya run out of time, we will letya continue ya target practice. But ya will lose alot of points.",
	"Now good luck kid. Dont be a dissapointment okay!?"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue",self,"finished")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()
	
	
func finished():
	get_node("/root/Game/Target_Container").show()
	Global.start_timer = true

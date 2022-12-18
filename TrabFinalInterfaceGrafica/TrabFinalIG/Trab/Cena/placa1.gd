extends Label

var placa1 = 0

func _ready():
	pass 

func _physics_process(delta):
	$placa1.text = str(placa1)
	if  Input.is_action_pressed("mudarposição"):
	

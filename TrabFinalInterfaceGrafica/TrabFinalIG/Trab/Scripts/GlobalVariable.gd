extends Node

var placar1=0 
var placar2=11

func _ready():
	
	pass 
func _physics_process(delta):

	pass
	
		

func _on_Final_body_entered(body):
	$Ganhou.text = str("GANHOU")
	print("Chegou no Final")
	pass # Replace with function body.




func _on_direita_body_entered(body):
	print("Hit")
	get_tree().reload_current_scene()
	pass # Replace with function body.







func _on_cima_body_entered(body):
	pass # Replace with function body.

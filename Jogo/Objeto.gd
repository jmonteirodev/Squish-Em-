extends KinematicBody2D
var objeto = Vector2()
const GRAVIDADE = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	global_position.y += GRAVIDADE
	objeto = move_and_slide(objeto)

func _on_Area2D_body_entered(body):
	if(body.name == 'player'):
		print('player')
		body.returnPositionInitial()

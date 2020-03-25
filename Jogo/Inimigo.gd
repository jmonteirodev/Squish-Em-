extends KinematicBody2D
var body = Vector2()
const CHAO = Vector2(0,1)
const GRAVIDADE = 30
var contador = 0
var direcao = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	body.y += GRAVIDADE
	
	body.x = direcao*100
	if(contador == 300):
		direcao = -1
	if(contador == -100):
		direcao = 1
	contador += direcao
	body = move_and_slide(body, CHAO)

func _on_causaDano_body_entered(body):
	if(body.name == 'player'):
		body.returnPositionInitial()

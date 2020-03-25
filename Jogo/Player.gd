extends KinematicBody2D
var body = Vector2()
const CHAO = Vector2(0,-1)
const VELOCIDADE = 250
const GRAVIDADE = 1200
var subindo = false
var initialPosition
var vidas = 3
var contadorObjetos
# Called when the node enters the scene tree for the first time.
func _ready():
	body = Vector2()
	initialPosition = global_position
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
			body.x = VELOCIDADE
	elif Input.is_action_pressed("ui_left"):
		body.x = -VELOCIDADE
	else:
		body.x = 0
	if($RayCast2D.is_colliding()):
		var a = $RayCast2D.get_collider()
		if(a.name == "chaoInimigo"):
			if Input.is_action_pressed("ui_up"):		
				body.y = -VELOCIDADE
			else:
				body.y = 0
		if(a.name == "chão"):
			body.y -= VELOCIDADE
	else:
		body.y = -VELOCIDADE
	body = move_and_slide(body, CHAO)

func returnPositionInitial():
	global_position = initialPosition
	vidas = vidas-1
	if(vidas < 1):
		hide()
		
func itemCapturado():
	print('Vitória')
	
func _on_Area2D_body_entered(body):
	if(body.name == 'Item'):
		itemCapturado()

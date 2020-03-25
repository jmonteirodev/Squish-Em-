extends Node2D
var contadorObjetos
var initialPositionY
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	contadorObjetos = 0
	initialPositionY = $Objetos/Objeto.global_position.y
	print(initialPositionY)
func lancarObjeto():
	contadorObjetos += 1
	if(contadorObjetos == 600):
		$Objetos/Objeto.global_position.x = $player.global_position.x
		$Objetos/Objeto.global_position.y = initialPositionY
		contadorObjetos = 0
func _physics_process(delta):
	lancarObjeto()
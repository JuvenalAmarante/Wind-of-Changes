extends KinematicBody2D


export var velocidade_andar = 60
var pos = "Idle_Up"

var movement = Vector2(0,0)

func _physics_process(delta):

	
	var horizontal_Axis = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	movement.x = velocidade_andar * horizontal_Axis
	var vertical_Axis = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	movement.y = velocidade_andar * vertical_Axis
	
	
	move_and_slide(movement,Vector2.UP)
	
	update_animation()

func update_animation():
	if movement.x > 0:
		$AnimatedSprite.scale.x = -1
	elif movement.x < 0:
		$AnimatedSprite.scale.x = 1
		
	if movement.y == 0 and abs(movement.x) > 0:
		$AnimatedSprite.play("Walk_Left")
		pos = "Idle_Left"
	if movement.y > 0 and movement.x == 0:
		$AnimatedSprite.play("Walk_Down")
		pos = "Idle_Down"
	elif movement.y < 0 and movement.x == 0:
		$AnimatedSprite.play("Walk_Up")
		pos = "Idle_Up"
	elif movement.y == 0 and movement.x == 0: 
		$AnimatedSprite.play(pos)
		# $AnimatedSprite.play("Walk_Up")
		# $AnimatedSprite.play("Walk_Down")

extends KinematicBody2D

#var velocity = Vector2.ZERO

#export var jump_velocity = 1000.0
#export var gravity_scale = 10.0

export var fallMultiplier = 2 
export var lowJumpMultiplier = 30 
export var jumpVelocity = 600 #Jump height

#Physics
var velocity = Vector2()
export var gravity = 8


var score = 0

var can_jump: bool = true

onready var animation = $AnimatedSprite

func _ready():
	Signals.connect("killplayer",self,"killplayer")
	Signals.connect("rewardplayer",self,"rewardplayer")
	
	animation.play("Run")

func _physics_process(delta):

	#Applying gravity to player
	velocity.y += gravity 

	#Jump Physics
	if velocity.y > 0: #Player is falling
		velocity += Vector2.UP * (-9.81) * (fallMultiplier) #Falling action is faster than jumping action | Like in mario


	elif velocity.y < 0 && Input.is_action_just_released("jump"): #Player is jumping 
		velocity += Vector2.UP * (-9.81) * (lowJumpMultiplier) #Jump Height depends on how long you will hold key

	if is_on_floor():
		if Input.is_action_just_pressed("jump"): 
			velocity = Vector2.UP * jumpVelocity #Normal Jump action
			animation.play("jump")
	velocity = move_and_slide(velocity, Vector2(0,-1))





func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		print("Right")
		can_jump = true
		animation.play("run")


func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		print("Left")
		can_jump = false







func killplayer():
	queue_free()
	
func rewardplayer(scoretoadd):
	score+=scoretoadd
	print(String(score))
	Signals.emit_signal("updatescore",score)

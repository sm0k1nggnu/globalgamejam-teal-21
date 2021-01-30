extends KinematicBody2D


var win = 0
#var velocity = Vector2.ZERO

#export var jump_velocity = 1000.0
#export var gravity_scale = 10.0

export var fallMultiplier = 2 
export var lowJumpMultiplier = 30 
export var jumpVelocity = 600 #Jump height

#Physics
var velocity = Vector2()
export var gravity = 8


var can_jump: bool = true

onready var animation = $AnimatedSprite

func _ready():
	Signals.connect("killplayer",self,"killplayer")
	Signals.connect("end",self,"ending")
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
		if win == 0:
			can_jump = true
			animation.play("run")


func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		can_jump = false

func ending():
	win = 1
	print("second")
	animation.play("stop")
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	Signals.emit_signal("final")




func killplayer():
	queue_free()
	
func rewardplayer(scoretoadd):
	Globals.score += scoretoadd
	print(Globals.score)
	Signals.emit_signal("updatescore",Globals.score)

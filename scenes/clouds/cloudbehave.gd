extends "ScrollMovement_clouds.gd"

func _ready():
	self.global_position.y = rand_range(0,300)

func _physics_process(delta):
	move_cloud()

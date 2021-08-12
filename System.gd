extends Node2D

export var rotation_speed = PI

func _process(delta):
	rotation += rotation_speed * delta
	$Planet/MoonOrbit/Moon.global_rotation = 0

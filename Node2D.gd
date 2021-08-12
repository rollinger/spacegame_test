tool
extends Node2D

export var rotation_speed = PI


func _process(delta):
	
	rotation += rotation_speed * delta
	$Sprite/Pivot/Sprite2.global_rotation = 0

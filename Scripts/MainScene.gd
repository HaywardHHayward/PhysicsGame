extends Node

onready var childrenNodes = get_children()

func _physics_process(delta):
	for node in childrenNodes:
		print(node.Velocity)
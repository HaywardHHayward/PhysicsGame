extends Area2D

const G = 6.67408e-11

onready var treeNode = get_tree()

onready var groupNodes = treeNode.get_nodes_in_group("Matter")

func _ready():
	add_to_group("Matter")

export(Vector2) var Velocity = Vector2(0,0)

export(float, 0, 1e55) var Mass = 1

const PIXELSPERMETER = 64.0

const METERSPERPIXEL = 1/PIXELSPERMETER

func gravitation(object):
	var force = G * ((Mass * object.Mass) / pow(distance(object),2))
	return force

func force(force):
	var acceleration = force / Mass
	return acceleration * PIXELSPERMETER

func relativePosition(object):
	return to_local(object.global_position)

func distance(object):
	return global_position.distance_to(object.global_position)*METERSPERPIXEL

func _physics_process(delta):
	for objectNode in groupNodes:
		if objectNode != self:
			var unitVector = relativePosition(objectNode).normalized()
			Velocity += unitVector * force(gravitation(objectNode))/60.0
	translate(Velocity)
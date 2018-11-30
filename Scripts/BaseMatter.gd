extends Area2D

const G = 6.67408e-11

onready var treeNode = get_tree()

onready var groupNodes = treeNode.get_nodes_in_group("Matter")

onready var internalPosition = get_position()

signal clicked

func _ready():
	self.connect("clicked", treeNode, "_clicked")
	add_to_group("Matter")
	scale = Vector2(Radius, Radius) * 4

export(String) var Name = "Object"

export(Vector2) var Velocity = Vector2(0,0)

export(float, 0, 1e55) var Mass = 1

export(float, 0, 1e50) var Radius = 0#Cosmetic, doesn't change the physics

const PIXELSPERMETER = 64.0 #For every meter, there are 64.0 pixels

const METERSPERPIXEL = 1/PIXELSPERMETER #For every pixel, there are 1/64 meters

func gravitation(object):
	var force = G * ((Mass * object.Mass) / pow(distance(object),2))
	return force

func acceleration(force):
	var acceleration = force / Mass
	return acceleration

func kineticEnergy(object):
	return (1/2)*object.Mass*pow(object.Velocity.length(), 2)

func relativePosition(object):
	return to_local(object.internalPosition)

func distance(object):
	return internalPosition.distance_to(object.internalPosition)*METERSPERPIXEL

func attract():
	for objectNode in groupNodes:
			if objectNode != self:
				var unitVector = relativePosition(objectNode).normalized()
				Velocity += unitVector * acceleration(gravitation(objectNode))
	internalPosition += Velocity*PIXELSPERMETER/60.0
	position = internalPosition

func _physics_process(delta):
	attract()

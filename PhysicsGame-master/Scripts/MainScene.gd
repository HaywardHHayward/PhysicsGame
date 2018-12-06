extends Node

signal clickedMain

signal pausedMain

signal unpausedMain

onready var matter = get_tree().get_nodes_in_group("Matter")

func _ready():
	self.connect("clickedMain", $Camera2D/GUI/ObjectViewer, "_clicked")
	for node in matter:
		self.connect("pausedMain", node, "paused")
		self.connect("unpausedMain", node, "unpaused")

func _process(delta):
	matter = get_tree().get_nodes_in_group("Matter")
	for node in matter:
		if self.is_connected("pausedMain", node, "paused") == false:
			self.connect("pausedMain", node, "paused")
		if self.is_connected("unpausedMain", node, "unpaused") == false:
			self.connect("unpausedMain", node, "unpaused")

func _clicked(newObject):
	emit_signal("clickedMain", newObject)

func paused():
	emit_signal("pausedMain")

func unpaused():
	emit_signal("unpausedMain")
	
func newObject(object):
	self.connect("pausedMain", object, "paused")
	self.connect("unpausedMain", object, "unpaused")
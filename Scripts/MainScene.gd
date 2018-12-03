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
	pass

func _clicked(newObject):
	emit_signal("clickedMain", newObject)
	
func paused():
	emit_signal("pausedMain")
	
func unpaused():
	emit_signal("unpausedMain")
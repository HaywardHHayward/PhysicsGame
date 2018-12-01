extends Node

signal clickedMain

func _ready():
	self.connect("clickedMain", $Camera2D/GUI/ObjectViewer, "_clicked")

func _process(delta):
	pass

func _clicked(newObject):
	emit_signal("clickedMain", newObject)
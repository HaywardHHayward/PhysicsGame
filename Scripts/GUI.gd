extends CanvasLayer

var timePassed = 0

func _ready():
	pass

func _process(delta):
	timePassed += delta
	$TimeContainer/TimePassed/Time.text = str(timePassed)
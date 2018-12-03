extends LineEdit

func _ready():
	pass

func _process(delta):
	if float(text) > 10e1:
		text = "%fe%d" % [float(text)/(floor(log(float(text))/log(10))), floor(log(float(text))/log(10))]
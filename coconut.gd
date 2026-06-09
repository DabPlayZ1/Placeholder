extends StaticBody3D
func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	self.hide()
func interact():
	%Player.coconuts += 1
	process_mode = Node.PROCESS_MODE_DISABLED
	self.hide()
	notify()
func notify():
	var text = "Coconut: " + str(%Player.coconuts) + "/7\n"
	%Status.text += text
	%Statuscont.show()
	await get_tree().create_timer(1.5).timeout
	%Status.text = %Status.text.replace(text, "")
	if %Status.text == "":
		%Statuscont.hide()
	self.queue_free()

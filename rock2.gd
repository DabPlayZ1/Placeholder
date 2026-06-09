extends StaticBody3D
var text = ["Don't you dare jump over me."]
var text2 = ["Now I'm sad.."]
@export var jumped = false
func interact():
	if jumped == false:
		print("interacted")
		%Header.text = "Long rock"
		%Player.can_move = false
		%Dialogue.diagtext = text
		%Dialogue.dialogueon = true
	else:
		print("interacted")
		%Header.text = "Long rock"
		%Player.can_move = false
		%Dialogue.diagtext = text2
		%Dialogue.dialogueon = true

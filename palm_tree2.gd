extends StaticBody3D
var text = ["He's busy staring into the horizon.", "Why? Because he's blind."]
func interact():
		print("interacted")
		%Header.text = "Blind Palm Tree"
		%Player.can_move = false
		%Dialogue.diagtext = text
		%Dialogue.dialogueon = true

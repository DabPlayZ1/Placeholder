extends StaticBody3D
var dialogue : Array = ["What a relaxing day.", "Good sun, sitting back, enjoying the view.."]
var dialogue2 : Array = ["Looks like you made palm tree pretty mad.", "How about we have a challenge?", "If you win, I'll give you palm tree's nuts.", "Don't move for 1 minute and you win.", "START"]
var win : Array = ["Looks like you moved.", "Now you have to play Rock, Paper, Scissors with me."]
var lose : Array = ["Sorry bud. I was hired to keep you in place."]
var quested : bool = false
func _ready():
	await get_tree().create_timer(7.5).timeout
func interact():
	if %Player.palmquest == false:
		%Header.text = "Beach Chair"
		%Player.can_move = false
		%Dialogue.diagtext = dialogue
		%Dialogue.dialogueon = true
	elif quested == false:
		%Header.text = "Beach Chair"
		quested = true
		%Player.can_move = false
		%Player.moved = false
		%Dialogue.diagtext = dialogue2
		%Dialogue.dialogueon = true
		%Objectives.text += "\nDon't move."
		movechallenge()
func movechallenge():
	for i in range(10):
		if %Player.moved == false:
			print("not yet")
			await get_tree().create_timer(1).timeout
		else:
			break
	if %Player.moved == true:
		print("MOVED")
		%Header.text = "Beach Chair"
		%Player.can_move = false
		%Dialogue.dialogueon = true
		%Dialogue.diagtext = win
	elif %Player.moved == false:
		%Header.text = "Beach Chair"
		%Player.can_move = false
		%Dialogue.dialogueon = true
		%Dialogue.diagtext = lose
		

extends StaticBody3D

var lost : bool = false
var chose_rock : bool = false
var chose_paper : bool = false
var chose_scissor : bool = false
var quested : bool = false
var RandomRPS: Array = ["Rock", "Paper", "Scissor"]
var Idle : Array = ["Wassup dude I'm rockin. It's cool being this hard sometimes."]
var WannaPlay : Array = ["Wanna know how to rock with me", "Beat me in my game then."]
var StartGame: Array = ["Alright! Rock Paper Scissors Shoot!"]
var WinGame: Array = ["Wow You Won!", "Here's the secret to how I rock...", "Oh wait dude look behind you there's something.."]
var LoseGame: Array = ["Haha You Lost!", "You know what the bet was", "Go do something else"]
var TryAgain: Array = ["Oh you're back for another round?", "Prepared to lose again?"]
var rock_choice : String = RandomRPS[randi_range(0,2)]
var Rock : Array = ["I choose Rock!"]
var Paper : Array = ["I choose Paper!"]
var Scissor : Array = ["I choose Scissor!"]
var YouChose = ""
var Start : bool = false

func interact():
	if %Player.palmquest == true:
		%Header.text = "The Rock"
		%Dialogue.diagtext = Idle
		%Dialogue.dialogueon = true
	if quested == false:
		print("Can Interact")
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = WannaPlay
		%Dialogue.dialogueon = true
		quested = true
		await %Dialogue.dialogue_finished
		Start = true
		ReverseRPS()
func ReverseRPS():
	if Start == true:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = StartGame
		%Dialogue.dialogueon = true
		%RockButton.visible = true
		%PaperButton.visible = true
		%ScissorButton.visible = true
func decision():
	if rock_choice == "Rock" and chose_scissor == true:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Rock
		%Dialogue.dialogueon = true
		%Dialogue.dialoguenumber = -1
		lost = true
	if rock_choice == "Rock" and chose_paper:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Rock
		%Dialogue.dialogueon = true
		%Dialogue.dialoguenumber = -1
		lost = false
		
	if rock_choice == "Paper" and chose_scissor == true:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Paper
		%Dialogue.dialogueon = true
		%Dialogue.dialoguenumber = -1
		lost = true
	if rock_choice == "Scissor" and chose_rock == true:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Scissor
		%Dialogue.dialogueon = true
		%Dialogue.dialoguenumber = -1
		lost = true
	outputter()
func outputter():
	if lost == true:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = LoseGame
		%Dialogue.dialogueon = true
		%Dialogue.dialoguenumber = -1
		%RockButton.visible = false
		%PaperButton.visible = false
		%ScissorButton.visible = false
	else:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = WinGame
		%Dialogue.dialogueon = true
		%Dialogue.dialoguenumber = -1
		%RockButton.visible = false
		%PaperButton.visible = false
		%ScissorButton.visible = false
func _on_rock_button_pressed() -> void:
	chose_paper = true
	decision()


func _on_paper_button_pressed() -> void:
	chose_scissor = true
	decision()

func _on_scissor_button_pressed() -> void:
	chose_rock = true
	decision()

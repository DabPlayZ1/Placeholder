extends StaticBody3D

var lost = false
var quested : bool = false
var Idle : Array = ["Wassup dude, I'm rockin. It's cool being this hard sometimes."]
var WannaPlay : Array = ["Wanna know how to rock with me", "Beat me in my game then."]
var StartGame: Array = ["Alright! Rock Paper Scissors Shoot!"]
var WinGame: Array = ["Wow, you won even though it was reversed!", "Here's the secret to how I rock...", "Oh wait dude look behind you there's something there.."]
var LoseGame: Array = ["Haha You Lost!", "You'll never find out my trick!", "Go do something else."]
var DrawGame : Array = [" Looks like it's a draw.", "Let's try again."]
var TryAgain: Array = ["Oh you're back for another round?", "Prepared to lose again?"]
var Rock : Array = ["I chose Rock!"]
var Paper : Array = ["I chose Paper!"]
var Scissors : Array = ["I chose Scissors!"]
func interact():
	if %Player.palmquest == false:
		%Header.text = "The Rock"
		%Dialogue.diagtext = Idle
		%Dialogue.dialogueon = true
	elif quested == false:
		print("Can Interact")
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = WannaPlay
		%Dialogue.dialogueon = true
		quested = true
		await %Dialogue.dialogue_finished
		ReverseRPS()
	elif quested == true:
		print("Can Interact")
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = TryAgain
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		ReverseRPS()
func ReverseRPS():
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		%Player.captured = false
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = StartGame
		%Dialogue.dialogueon = true
		%Player.playing = true
		await %Dialogue.dialogue_finished
		%RockButton.visible = true
		%PaperButton.visible = true
		%ScissorButton.visible = true
func outputter():
	if lost == true:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = LoseGame
		%Dialogue.dialogueon = true
		%RockButton.visible = false
		%PaperButton.visible = false
		%ScissorButton.visible = false
		%Player.playing = false
		await %Dialogue.dialogue_finished
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		%Player.captured = true
	else:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = WinGame
		%Dialogue.dialogueon = true
		%RockButton.visible = false
		%PaperButton.visible = false
		%ScissorButton.visible = false
		%Player.playing = false
		await %Dialogue.dialogue_finished
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		%Player.captured = true
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position:y", -10 , 2)
		self.process_mode = Node.PROCESS_MODE_DISABLED
		await tween.finished
		self.queue_free()
func rock():
	var rng = randi_range(1,3)
	if rng == 1:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Rock
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = DrawGame
		%Dialogue.dialogueon = true
		%RockButton.visible = false
		%PaperButton.visible = false
		%ScissorButton.visible = false
		await %Dialogue.dialogue_finished
		ReverseRPS()
	elif rng == 2:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Paper
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		lost = false
		outputter()
	elif rng == 3:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Scissors
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		lost = true
		outputter()
func paper():
	var rng = randi_range(1,3)
	if rng == 1:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Rock
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		lost = true
		outputter()
	elif rng == 2:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Paper
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = DrawGame
		%Dialogue.dialogueon = true
		%RockButton.visible = false
		%PaperButton.visible = false
		%ScissorButton.visible = false
		await %Dialogue.dialogue_finished
		ReverseRPS()
	elif rng == 3:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Scissors
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		lost = false
		outputter()
func scissors():
	var rng = randi_range(1,3)
	if rng == 1:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Rock
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		lost = false
		outputter()
	elif rng == 2:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Paper
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		lost = true
		outputter()
	elif rng == 3:
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = Scissors
		%Dialogue.dialogueon = true
		await %Dialogue.dialogue_finished
		%Header.text = "The Rock"
		%Player.can_move = false
		%Dialogue.diagtext = DrawGame
		%Dialogue.dialogueon = true
		%RockButton.visible = false
		%PaperButton.visible = false
		%ScissorButton.visible = false
		await %Dialogue.dialogue_finished
		ReverseRPS()
func _on_rock_button_pressed() -> void:
	rock()
func _on_paper_button_pressed() -> void:
	paper()
func _on_scissor_button_pressed() -> void:
	scissors()

extends StaticBody3D
var dialogue : Array = ["What a relaxing day.", "Good sun, sitting back, enjoying the view.."]
var dialogue2 : Array = ["Looks like you made palm tree pretty mad.", "How about we have a challenge?", "If you win, I'll give you palm tree's nuts.", "Don't move for 1 minute and you win.", "START"]
var win : Array = ["Looks like you moved. No nuts for you.", "Now you have to play heads or tails with me!"]
var lose : Array = ["You actually thought I was telling the truth?", "You're so stupid lol.", "Get scammed idiot.", " But if you beat me at heads or tails..", "Maybe I'll give you the nuts."]
var start : Array = ["Alright so Heads or Tails?"]
var heads : Array = ["Haha noob, it's tails. You Lose bozo. Try again another time"]
var tails : Array = ["Haha noob, it's heads. You Lose bozo. Try again another time"]
var replay_dialogue : Array = [
	"Back for another round?",
    "Heads or tails?"
]
var clicked_heads : bool = false
var quested : bool = false
var heads_or_tails : bool = false
var interactable : bool = true
@export var lostonce : bool = false

func interact():
	if !interactable:
		return
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
	if lostonce == true:
		%Header.text = "Beach Chair"
		%Dialogue.dialogueon = true
		%Dialogue.diagtext = replay_dialogue
		%Player.can_move = false
		%Player.playing = true
		await %Dialogue.dialogue_finished
		%HeadsButton.visible = true
		%TailsButton.visible = true
		%Player.captured = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
func movechallenge():
	for i in range(60):
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
		interactable = false
		await %Dialogue.dialogue_finished
	elif %Player.moved == false:
		%Header.text = "Beach Chair"
		%Player.can_move = false
		%Dialogue.dialogueon = true
		%Dialogue.diagtext = lose
		await %Dialogue.dialogue_finished
	heads_or_tails = true
	if heads_or_tails == true:
		%Header.text = "Beach Chair"
		%Dialogue.dialogueon = true
		%Dialogue.diagtext = start
		%Player.can_move = false
		%Player.playing = true
		await %Dialogue.dialogue_finished
		%HeadsButton.visible = true
		%TailsButton.visible = true
		%Player.captured = false
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
func _on_heads_button_pressed() -> void:
	heads_or_tails = false
	%HeadsButton.visible = false
	%TailsButton.visible = false
	interactable = true
	clicked_heads = true
	%Dialogue.dialoguenumber = -1
	%Dialogue.dialogueon = true
	%Dialogue.diagtext = heads
	interactable = true
	lostonce = true
	await %Dialogue.dialogue_finished
	%Player.playing = false
	%Player.captured = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_tails_button_pressed() -> void:
	heads_or_tails = false
	%HeadsButton.visible = false
	%TailsButton.visible = false
	interactable = true
	clicked_heads = true
	%Dialogue.dialoguenumber = -1
	%Dialogue.dialogueon = true
	%Dialogue.diagtext = tails
	interactable = true
	lostonce = true
	await %Dialogue.dialogue_finished
	%Player.playing = false
	%Player.captured = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

extends StaticBody3D

@export var quest_name : String = "\nFind 7 Coconuts"
@export var questtext = ["YO BRO WASSUP.", "I DUN DID AND LOS MY NUTS.", "GO GET EM FOR ME, THX"]
@export var rewardtext = ["Are you an idiot?", "I said I lost my nuts, not coconuts.", "Get out of my sight."]

var quested = false
func interact():
	if quested == false:
		print("Can Interact")
		%Header.text = "Palm Tree"
		%Player.can_move = false
		%Dialogue.diagtext = questtext
		%Dialogue.dialogueon = true
		%Objectives.text += quest_name
		quested = true
		await get_tree().create_timer(10).timeout
		%Player.coconuts = 7
	elif %Player.coconuts == 7 and quested == true:
		%Header.text = "Palm Tree"
		%Player.can_move = false
		%Dialogue.diagtext = rewardtext
		%Dialogue.dialogueon = true
		%Objectives.text = %Objectives.text.replace("\nFind 7 Coconuts", "")

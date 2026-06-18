extends StaticBody3D

@export var quest_name : String = "\nFind 7 Coconuts"
@export var questtext : Array = ["YO BRO WASSUP.", "I DUN DID AND LOS MY NUTS.", "GO GET EM FOR ME, THX"]
@export var rewardtext : Array  = ["Are you an idiot?", "I said I lost my nuts, not coconuts.","I'm a WALNUT tree after all.", "Get out of my sight."]
var quested : bool = false
func interact():
	if quested == false:
		print("Can Interact")
		%Header.text = "Palm Tree"
		%Player.can_move = false
		%Dialogue.diagtext = questtext
		%Dialogue.dialogueon = true
		%Objectives.text += quest_name
		quested = true
		for coconut in %COCONUTFOLDER.get_children():
			coconut.process_mode = Node.PROCESS_MODE_INHERIT
			coconut.show()
	elif %Player.coconuts == 7 and quested == true:
		%Header.text = "Palm Tree"
		%Player.can_move = false
		%Dialogue.diagtext = rewardtext
		%Dialogue.dialogueon = true
		%Objectives.text = %Objectives.text.replace("\nFind 7 Coconuts", "")
		%Player.palmquest = true
		await %Dialogue.dialogue_finished
		self.name = "Walnut Tree"

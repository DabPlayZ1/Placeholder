extends StaticBody3D

@export var quest_name : String = "Quest: Find 7 Coconuts"
@export var reward : String = "Reward: Nothing Yet"

func _ready():
	%QuestName.hide()
	%Reward.hide()
	%QuestGiverBox.hide()
	%Quest_Heading.hide()
	
	%Reward.text = reward
	%QuestName.text = quest_name
func interact():
	print("Can Interact")
	%QuestName.show()
	%QuestGiverBox.show()
	%Reward.show()
	%Quest_Heading.show()

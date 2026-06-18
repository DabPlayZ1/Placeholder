extends StaticBody3D
var early : Array = ["There are still mistakes to be made.", "Return once you wish to rectify all 4 errors."]
var dialogue : Array = ["You have made 4 errors, but the fault is not yours.", "This world has tricked you into making mistakes.", "I shall revert this world into its original state.", "Talk to me first, I shall help you."]
func interact():
	if (%Player.palmquest == true and %Rock.played == true and %"Long Rock".jumped == true and %"Beach Chair".lostonce == true) or %Player.testing == true:
		%Header.text = "Truthseeker"
		%Player.can_move = false
		%Dialogue.diagtext = dialogue
		%Dialogue.dialogueon = true
	elif not (%Player.palmquest == true and %Rock.played == true and %"Long Rock".jumped == true and %"Beach Chair".lostonce == true):
		%Header.text = "Truthseeker"
		%Player.can_move = false
		%Dialogue.diagtext = early
		%Dialogue.dialogueon = true

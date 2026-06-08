extends Control
var text = [
"Hey", 
"I'm gonna teach you about the game.", 
"All the objects in this world are filled with life.",
"Somehow, their life energy is being drained.",
"Your goal is to help them survive.",
"Use the 'F' Key to Interact.",
"The game doesn't have sprint yet.",
"Interact with everyone, and explore the world.",
]
@export var dialogueon = true
@export var dialoguenumber = -1
var cooldown = 0
func changetext(newtext):
	%Text.text = ""
	var tween = get_tree().create_tween()
	tween.tween_property(%Text, "text", newtext, 0.5)
func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), 1.5)
	%Player.can_move = false
func _process(delta: float) -> void:
	cooldown += delta
	if Input.is_action_just_pressed("Interact") and dialogueon == true and cooldown > 0.5:
		if not text.size() == dialoguenumber+1:
			dialoguenumber += 1
			changetext(text[dialoguenumber])
			cooldown = 0
		else:
			dialogueon = false
			dialoguenumber = -1
			get_tree().create_tween().tween_property(self, "modulate", Color(1,1,1,0), 1)
			%Player.can_move = true

extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		%"Long Rock".jumped = true
		self.queue_free()

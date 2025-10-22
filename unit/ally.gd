extends CharacterBody2D

var maxymove := 50
var minymove := -50
var currentymove := 0
var flag := true

func _on_timer_timeout() -> void:
	if currentymove >=maxymove:
		flag = false
	elif currentymove <= minymove:
		flag = true
	
	if flag:
		currentymove += 3
		global_position.y += 3
	else:
		currentymove -= 2
		global_position.y -= 2
		
	 

extends CharacterBody2D

@onready var navigation_agent_2d: NavigationAgent2D = $Navigation/NavigationAgent2D

@export var target_palyer: Player
const SPEED = 50.0


func _physics_process(_delta: float) -> void:
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	# 没有目的地
	if not dir:
		return
		
	# 已经到目的地附近   
	# 追击的时候需要注意的是单位的碰撞大小，碰撞大小>target_desired_distance，会导致单位永远到不了目的地,然后抖动
	if navigation_agent_2d.is_navigation_finished():
		return
		
	velocity = dir * SPEED
	move_and_slide()


func _on_timer_timeout() -> void:
	navigation_agent_2d.target_position = target_palyer.global_position

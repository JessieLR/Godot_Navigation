extends CharacterBody2D

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
const SPEED = 300.0

func _physics_process(_delta: float) -> void:
	var dir = get_nav_dir()
	# 没有目的地
	if not dir:
		return
	# 已经到目的地附近
	if navigation_agent_2d.is_navigation_finished():
		velocity = Vector2.ZERO
		move_and_slide()
		return
	velocity = dir * SPEED
	move_and_slide()

# 将点击的位置传入导航代理，并将获取到的下一个移动节点转本地坐标
func get_nav_dir():
	if not clickPosition:
		return
	navigation_agent_2d.target_position = clickPosition
	return to_local(navigation_agent_2d.get_next_path_position()).normalized()

@onready var main: Node2D = $".."
var clickPosition: Vector2

func _ready() -> void:
	main.setPosition.connect(setClickPosition)

func setClickPosition(position: Vector2) -> void:
	clickPosition = position

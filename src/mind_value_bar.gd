extends Control

class_name MindValueBar


func set_player_mind(mind:int) -> void:
	%PlayerMindBar.value = mind


func set_player_max_mind(max_mind:int) -> void:
	%PlayerMindBar.max_value = max_mind
	%PlayerMindBar.value = max_mind


func set_enemy_mind(mind:int) -> void:
	%EnemyMindBar.value = mind


func set_enemy_max_mind(max_mind:int) -> void:
	%EnemyMindBar.max_value = max_mind
	%EnemyMindBar.value = max_mind

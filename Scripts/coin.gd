extends Area2D

@onready var game_manager: Node = %GameManager
@onready var coin: Area2D = $"."
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	coin.position.y -= 10
	timer.start()


func _on_timer_timeout() -> void:
	queue_free()

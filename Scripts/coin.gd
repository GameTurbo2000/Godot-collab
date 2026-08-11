extends Area2D

@onready var game_manager: Node = get_tree().current_scene.get_node("GameManager")
@onready var coin: Area2D = $"."
@onready var timer: Timer = $Timer
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var fade_timer: Timer = $Fade_timer

# Halványulás
func fade_out():
	for i in range(10):
		fade_timer.start()
		
func _on_fade_timer_timeout() -> void:
	animated_sprite.modulate.a -= 0.1

func _on_body_entered(body: Node2D) -> void:
	collision_shape.queue_free()
	game_manager.add_point()
	animated_sprite.position.y -= 10
	fade_out()
	timer.start()


func _on_timer_timeout() -> void:
	queue_free()

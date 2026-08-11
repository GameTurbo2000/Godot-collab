extends Node2D

const SPEED = 60

var direction = 1
var alive = true

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $killzone/CollisionShape2D
@onready var area_2d: Area2D = $Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	if alive:
		position.x += direction * SPEED * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = -200
	
	alive = false
	collision_shape_2d.queue_free()
	animated_sprite.play("death")
	area_2d.queue_free()

extends RigidBody2D

var speed: Vector2 = Vector2(400, 0)  # Velocidade inicial da bolinha

# Chamado quando o nó entra na árvore de cena pela primeira vez.
func _ready() -> void:
	speed = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * 400
	set_linear_velocity(speed)

# Chamado quando a bolinha colide com outro corpo.
func _on_Ball_body_entered(body):
	if body.is_in_group("paddle"):
		# Refletir a direção
		var normal = (position - body.position).normalized()
		var new_velocity = get_linear_velocity().bounce(normal)  # Usando a velocidade atual
		set_linear_velocity(new_velocity)

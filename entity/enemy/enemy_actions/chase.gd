extends LogicNode

@onready var enemy = $"../.."
@onready var logic_tree: LogicTree = $".."

@export var max_distance_to_player: float = 215.0

var player: Player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = GameManager.get_player()
	var dir: Vector2 = player.global_position - enemy.global_position
	enemy.distance_to_player = dir.length()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Make sure a player is present
	if !player:
		return
	var dir: Vector2 = player.global_position - enemy.global_position
	enemy.distance_to_player = dir.length()
	if enemy.distance_to_player > max_distance_to_player:
		# Move towards the player
		var dir_norm: Vector2 = dir.normalized()
		enemy.target_velocity = dir_norm * enemy.entity_stats.movement_speed
		enemy.current_velocity = enemy.current_velocity.move_toward(enemy.target_velocity, delta * 10.0)
		var coll: KinematicCollision2D = enemy.move_and_collide(enemy.current_velocity * delta * 100.0)

		if coll:
			if coll.get_collider_id() == player.get_instance_id():
				player.take_damage(enemy.entity_stats.contact_damage)

func evaluate() -> bool:
	return enemy.distance_to_player < max_distance_to_player

func execute_logic() -> void:
	for child in get_children():
		if child.evaluate():
			child.execute_logic()
			break
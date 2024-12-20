class_name Boss extends Enemy

@export var spawn_offset: Vector2 = Vector2(0.0, -100.0)
@export var boss_title: String = ""
@onready var shadow: Sprite2D = $Shadow

func _ready() -> void:
	super()
	GameManager.add_boss(self)
	enemy_base.destroy_object.connect(_on_death)

func _on_death() -> void:
	GameManager.boss_killed.emit(self)
	shadow.visible = false
	_spawn_drops()
	queue_free()

extends Ability

const RIFLE = preload("res://player/gun/gun_types/rifle/rifle.tres")
const BULLET = preload("res://player/gun/bullets/basic/bullet.tscn")

func apply_effects(player_stats: PlayerStats) -> void:
	player.weapon_manager.add_weapon(RIFLE, BULLET)
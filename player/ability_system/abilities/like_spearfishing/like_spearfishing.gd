extends Ability

func apply_effects(player_stats: PlayerStats) -> void:
	player_stats.extra_projectile_pierce += 1
	player_stats.damage -= 0.1
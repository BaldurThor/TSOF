@tool
class_name WeaponType extends Resource

## A useful resource which handles all details related to a weapon type's base stats.

signal range_changed(new_radius: float)

@export_category("Primary Stats")
## Base damage dealt by each projectile fired by the weapon
@export_range(1, 10, 1, "or_greater") var damage: int
## How effective flat damage multipliers are for the weapon (useful for weapons that inherently fire more projectiles).
@export_range(0.1, 2.0, 0.1, "or_greater") var damage_effectiveness: float
## Base interval of which the weapon attacks
@export_range(0.1, 5.0, 0.01, "or_greater") var attack_speed: float
## Chance of an attack from the weapon dealing bonus damage
@export_range(0.0, 100.0, 0.1, "or_greater") var crit_chance: float
## Multiplier to attacks that are critical strikes
@export_range(1.0, 3.0, 0.1, "or_greater") var crit_damage: float

@export_category("Secondary Stats")
## Whether to fire all of the projectiles consecutively (if true), or only fire
## a single projectile (if false). The latter is useful for weapons with secondary
## effects, such as the frag grenade.
@export var burst: bool = false
## The delay between each projectile spawning when burst is enabled
@export var delay_between_burst_projectiles: float
## The number of enemies that a projectile fired by the weapon can hit before despawning
@export_range(0, 100, 1) var pierce_count: int
## The multiplier to the linear velocity of the projectile fired by the weapon
@export var projectile_speed: float
## Number of projectiles fired by the weapon
@export_range(1, 25, 1, "or_greater") var projectile_count: int
## The min/max angle of which the projectile is curved when the weapon attacks
@export var projectile_spread: Curve
## The radius of the Area2D which determines the max targeting range
@export var range: float:
	set(value):
		range = value
		range_changed.emit(value)

@export_category("Configuration")
## The type of enemy the weapon targets
@export var target_priority: consts.TargetPriority

@export_category("Resources")
## The sprite used by the weapon
@export var sprite: Texture2D
## The sound-effect played on attack
@export var attack_sfx: AudioStream

@export_category("Debug")
## Debug utility which changes the color of the TargetRange's Shape.
## Requires [Debug] -> [Visible Collision Shapes] to be enabled.
## NOTE: Ensure that alpha is set to a reasonable value, otherwise it's entirely solid.
@export var attack_range_debug_color: Color = Color.AQUAMARINE

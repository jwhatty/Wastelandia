# 1. Create the objectives
scoreboard objectives add rads dummy "Radiation Level"
scoreboard objectives add deaths deathCount
scoreboard objectives add rad_prot dummy "Radiation Protection"
scoreboard objectives add rad_timer dummy "RadBeGone Timer"
scoreboard objectives add damage_taken custom:damage_taken

# 2. Initialize and Register all players (Clean and PAPI-friendly)
execute as @a run scoreboard players add @s rads 0
execute as @a run scoreboard players add @s rad_prot 0
execute as @a run scoreboard players add @s rad_timer 0

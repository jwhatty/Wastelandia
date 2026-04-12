# Create the scoreboard if it doesn't exist
scoreboard objectives add rads dummy "Radiation Level"

# Optional: Ensure players have a 0 score so the math doesn't break
execute as @a unless score @s rads matches -2147483648.. run scoreboard players set @s rads 0

scoreboard objectives add rad_prot dummy "Radiation Protection"

execute as @a unless score @s rad_prot matches -2147483648.. run scoreboard players set @s rad_prot 0 

# Timer for RadBeGone immunity (30 seconds)
scoreboard objectives add rad_timer dummy

scoreboard objectives add damage_taken custom:damage_taken

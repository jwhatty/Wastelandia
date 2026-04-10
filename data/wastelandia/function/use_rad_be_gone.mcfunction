# 1. Reset current radiation
scoreboard players set @s rads 0

# 2. Check the mainhand for the tier used
# Tier 1: 30s
execute if items entity @s weapon.mainhand *[custom_data~{rad_be_gone:1}] run scoreboard players set @s rad_timer 600
# Tier 2: 60s
execute if items entity @s weapon.mainhand *[custom_data~{rad_be_gone:2}] run scoreboard players set @s rad_timer 1200
# Tier 3: 90s
execute if items entity @s weapon.mainhand *[custom_data~{rad_be_gone:3}] run scoreboard players set @s rad_timer 1800

# 3. Targeted Clear
effect clear @s minecraft:slowness
effect clear @s minecraft:nausea
effect clear @s minecraft:hunger
effect clear @s minecraft:wither
effect clear @s minecraft:blindness

# 4. Cleanup Advancement
advancement revoke @s only wastelandia:consume_rad_be_gone

# 5. Sound
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.5

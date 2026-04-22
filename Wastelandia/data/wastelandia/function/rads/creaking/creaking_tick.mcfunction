# 1. Proximity (NEEDS 'at @s' to find nearby players)
execute as @e[type=creaking,tag=creaking_buffed] at @s run tag @a[distance=..4] add near_creaking

# 2. Combat (NEEDS 'at @s' so the teleport sub-function knows the center point)
execute as @e[type=creaking,tag=creaking_buffed,nbt={HurtTime:10s}] at @s run function wastelandia:rads/creaking/creaking_hurt
execute as @e[type=creaking,tag=creaking_buffed,nbt={HurtTime:9s}] at @s run function wastelandia:rads/creaking/creaking_hurt

# 3. Melee Strike (NEEDS 'at @s' to measure distance between player and creaking)
execute as @a[scores={damage_taken=1..,rad_timer=0,rad_prot=..9}] at @s if entity @e[type=creaking,tag=creaking_buffed,distance=..2.5] run scoreboard players add @s rads 75

# 4. Cleanup
scoreboard players set @a damage_taken 0

# --- 1. INITIAL STATS (Runs once per Creaking) ---
execute as @e[type=minecraft:creaking,tag=!creaking_buffed] run attribute @s minecraft:max_health base set 40.0
execute as @e[type=minecraft:creaking,tag=!creaking_buffed] run attribute @s minecraft:movement_speed base set 0.6
execute as @e[type=minecraft:creaking,tag=!creaking_buffed] run attribute @s minecraft:attack_damage base set 5.0
execute as @e[type=minecraft:creaking,tag=!creaking_buffed] run attribute @s minecraft:attack_knockback base set 1.0
execute as @e[type=minecraft:creaking,tag=!creaking_buffed] run data modify entity @s Health set value 40.0f
execute as @e[type=minecraft:creaking,tag=!creaking_buffed] run tag @s add creaking_buffed

# --- 2. PROXIMITY TAGGING (For Radiation Tick) ---
execute at @e[type=minecraft:creaking,tag=creaking_buffed] run tag @a[distance=..4] add near_creaking

# --- 3. TELEPORT BURST (When Creaking is Hit) ---
# We check 10s and 9s separately to avoid the range error. 
# Rad spike happens BEFORE they teleport away.
execute as @e[type=minecraft:creaking,tag=creaking_buffed,nbt={HurtTime:10s}] at @s run scoreboard players add @a[distance=..6,scores={rad_timer=0,rad_prot=..9}] rads 10
execute as @e[type=minecraft:creaking,tag=creaking_buffed,nbt={HurtTime:9s}] at @s run scoreboard players add @a[distance=..6,scores={rad_timer=0,rad_prot=..9}] rads 10

execute as @e[type=minecraft:creaking,tag=creaking_buffed,nbt={HurtTime:10s}] at @s run playsound minecraft:block.bell.resonate hostile @a ~ ~ ~ 1 0.8 0.5
execute as @e[type=minecraft:creaking,tag=creaking_buffed,nbt={HurtTime:10s}] at @s run particle minecraft:large_smoke ~ ~1 ~ 0.3 0.5 0.3 0.05 50

# The actual Teleport
execute as @e[type=minecraft:creaking,tag=creaking_buffed,nbt={HurtTime:10s}] at @p rotated ~ 0 positioned ^ ^ ^-5 run spreadplayers ~ ~ 0 5 false @s
execute as @e[type=minecraft:creaking,tag=creaking_buffed,nbt={HurtTime:9s}] at @p rotated ~ 0 positioned ^ ^ ^-5 run spreadplayers ~ ~ 0 5 false @s

# --- 4. MELEE STRIKE (When Player is Hit) ---
# Combine all three scoreboard checks into one bracket to avoid the duplicate error
execute as @a[scores={damage_taken=1..,rad_timer=0,rad_prot=..9}] at @s if entity @e[type=minecraft:creaking,tag=creaking_buffed,distance=..2.5] run scoreboard players add @s rads 75


# --- 5. CLEANUP ---
# Reset damage_taken so it doesn't double-spike next tick
scoreboard players set @a damage_taken 0

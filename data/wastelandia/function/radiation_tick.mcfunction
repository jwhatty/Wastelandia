# --- 1. THE DEATH RESET ---
execute as @a[scores={deaths=1..}] run scoreboard players set @s rads 0
execute as @a[scores={deaths=1..}] run effect clear @s
execute as @a[scores={deaths=1..}] run scoreboard players set @s deaths 0

# --- 2. PROTECTION CALCULATION ---
# Chest(4) > Legs(3) > Head(2) > Boots(1). Total = 10.
scoreboard players set @a rad_prot 0
execute as @a if items entity @s armor.head *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 2
execute as @a if items entity @s armor.chest *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 4
execute as @a if items entity @s armor.legs *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 3
execute as @a if items entity @s armor.feet *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 1

# --- 3. ACCUMULATION ---
# [0 pts] Unprotected: +1 Rad every tick
execute as @a[gamemode=survival,scores={rad_prot=0}] at @s if predicate wastelandia:in_crater run scoreboard players add @s rads 1
# (No title command here means naked players get no warning)

# [1-3 pts] Low Protection: +1 Rad every 2nd tick
execute as @a[gamemode=survival,scores={rad_prot=1..3}] at @s if predicate wastelandia:in_crater if predicate wastelandia:tick_rate/half run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=1..3}] at @s if predicate wastelandia:in_crater run title @s actionbar {"text":"⚠ Radiation High: Suit Failing","color":"gold"}

# [4-6 pts] Medium Protection: +1 Rad every 4th tick
execute as @a[gamemode=survival,scores={rad_prot=4..6}] at @s if predicate wastelandia:in_crater if predicate wastelandia:tick_rate/quarter run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=4..6}] at @s if predicate wastelandia:in_crater run title @s actionbar {"text":"⚙ Radiation Moderate: Suit Filtering","color":"yellow"}

# [7-9 pts] High Protection: +1 Rad every 10th tick
execute as @a[gamemode=survival,scores={rad_prot=7..9}] at @s if predicate wastelandia:in_crater if predicate wastelandia:tick_rate/tenth run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=7..9}] at @s if predicate wastelandia:in_crater run title @s actionbar {"text":"🛡 Radiation Low: Suit Holding","color":"green"}

# [10 pts] Full Suit: Immunity
execute as @a[gamemode=survival,scores={rad_prot=10}] at @s if predicate wastelandia:in_crater run title @s actionbar {"text":"✅ SUIT SEALED: RADIATION BLOCKED","color":"dark_green"}

# Water spike
execute as @a[gamemode=survival] at @s if predicate wastelandia:in_crater if block ~ ~ ~ minecraft:water run scoreboard players set @s rads 1201
execute as @a[gamemode=survival,scores={rad_prot=1..}] at @s if predicate wastelandia:in_crater if block ~ ~ ~ minecraft:water run title @s actionbar {"text":"☠ WATER IS HIGHLY RADIOACTIVE! ☠","color":"dark_red","bold":true}


# --- 4. RECOVERY (Outside) ---
execute as @a[gamemode=survival] at @s unless predicate wastelandia:in_crater if score @s rads matches 1.. run scoreboard players remove @s rads 1

# Only show "No Radiation" if they are safe AND wearing at least one piece of armor
execute as @a[scores={rad_prot=1..}] at @s unless predicate wastelandia:in_crater if score @s rads matches 0 run title @s actionbar {"text":"✚ No Radiation Detected ✚","color":"aqua"}

# Snap to 0 and wipe icons
execute as @a at @s unless predicate wastelandia:in_crater if score @s rads matches ..0 run scoreboard players set @s rads 0
execute as @a at @s unless predicate wastelandia:in_crater if score @s rads matches 0 run effect clear @s

# --- 5. THE EFFECTS ---
effect give @a[gamemode=survival,scores={rads=1..}] minecraft:slowness 2 0 true
effect give @a[gamemode=survival,scores={rads=1..}] minecraft:nausea 5 0 true
effect give @a[gamemode=survival,scores={rads=201..}] minecraft:hunger 2 0 true
effect give @a[gamemode=survival,scores={rads=801..}] minecraft:wither 2 0 true
effect give @a[gamemode=survival,scores={rads=1801..}] minecraft:wither 2 2 true
effect give @a[gamemode=survival,scores={rads=1801..}] minecraft:blindness 2 0 true

# Reset non-survival players
execute as @a[gamemode=!survival,scores={rads=1..}] run scoreboard players set @s rads 0
execute as @a[gamemode=!survival] run effect clear @s

# --- 1. THE DEATH RESET ---
# Added 'at @a' to ensure the score reset hits properly
execute as @a[scores={deaths=1..}] run scoreboard players set @s rads 0
execute as @a[scores={deaths=1..}] run effect clear @s minecraft:slowness
execute as @a[scores={deaths=1..}] run effect clear @s minecraft:nausea
execute as @a[scores={deaths=1..}] run effect clear @s minecraft:hunger
execute as @a[scores={deaths=1..}] run effect clear @s minecraft:wither
execute as @a[scores={deaths=1..}] run effect clear @s minecraft:blindness
execute as @a[scores={deaths=1..}] run scoreboard players set @s deaths 0
execute as @a[scores={deaths=1..}] run scoreboard players set @s rad_timer 0

# Reset radiation and timer if player enters Creative or Spectator
execute as @a[gamemode=!survival,gamemode=!adventure] run scoreboard players set @s rads 0
execute as @a[gamemode=!survival,gamemode=!adventure] run scoreboard players set @s rad_timer 0

# --- 2. PROTECTION CALCULATION ---
scoreboard players set @a rad_prot 0
execute as @a if items entity @s armor.head *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 2
execute as @a if items entity @s armor.chest *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 4
execute as @a if items entity @s armor.legs *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 3
execute as @a if items entity @s armor.feet *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 1
# Override protection if RadBeGone is active
execute as @a[scores={rad_timer=1..}] run scoreboard players set @s rad_prot 10


# --- 3. ACCUMULATION ---
# [0 pts] Unprotected
execute as @a[gamemode=survival,scores={rad_prot=0}] at @s if predicate wastelandia:in_crater run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=0},tag=near_creaking] run scoreboard players add @s rads 1

# [1-3 pts] Low Protection
execute as @a[gamemode=survival,scores={rad_prot=1..3}] at @s if predicate wastelandia:tick_rate/half if predicate wastelandia:in_crater run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=1..3},tag=near_creaking] if predicate wastelandia:tick_rate/half run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=1..3}] at @s if predicate wastelandia:in_crater run title @s actionbar {"text":"☢ BIOME: SUIT FAILING","color":"red","bold":true}
execute as @a[gamemode=survival,scores={rad_prot=1..3},tag=near_creaking] run title @s actionbar {"text":"☣ MUTANT: LOCALIZED FALLOUT","color":"dark_red","bold":true}

# [4-6 pts] Medium Protection
execute as @a[gamemode=survival,scores={rad_prot=4..6}] at @s if predicate wastelandia:tick_rate/quarter if predicate wastelandia:in_crater run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=4..6},tag=near_creaking] if predicate wastelandia:tick_rate/quarter run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=4..6}] at @s if predicate wastelandia:in_crater run title @s actionbar {"text":"☢ BIOME: SUIT FILTERING","color":"gold"}
execute as @a[gamemode=survival,scores={rad_prot=4..6},tag=near_creaking] run title @s actionbar {"text":"☣ MUTANT: HIGH RADIATION","color":"gold","bold":true}

# [7-9 pts] High Protection
execute as @a[gamemode=survival,scores={rad_prot=7..9}] at @s if predicate wastelandia:tick_rate/tenth if predicate wastelandia:in_crater run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=7..9},tag=near_creaking] if predicate wastelandia:tick_rate/tenth run scoreboard players add @s rads 1
execute as @a[gamemode=survival,scores={rad_prot=7..9}] at @s if predicate wastelandia:in_crater run title @s actionbar {"text":"☢ BIOME: SUIT HOLDING","color":"yellow"}
execute as @a[gamemode=survival,scores={rad_prot=7..9},tag=near_creaking] run title @s actionbar {"text":"☣ MUTANT: LOW RADIATION","color":"yellow"}

# [10 pts] Full Suit
execute as @a[gamemode=survival,scores={rad_prot=10}] at @s if predicate wastelandia:in_crater run title @s actionbar {"text":"🛡 BIOME: SUIT SEALED","color":"green"}
execute as @a[gamemode=survival,scores={rad_prot=10},tag=near_creaking] run title @s actionbar {"text":"🛡 MUTANT: RADIATION BLOCKED","color":"dark_green"}


# [RadBeGone Priority Message]
# Put this at the end of Section 3 so it has the final say over accumulation titles
execute as @a[scores={rad_timer=1..}] run title @s actionbar {"text":"🛡 RAD-BE-GONE ACTIVE: 100% IMMUNITY","color":"aqua"}

# --- 4. RECOVERY (The Missing Logic) ---
# REMOVAL: Actually subtracts points if safe or fully protected
execute as @a[gamemode=survival] at @s if score @s rad_prot matches 10 if score @s rads matches 1.. run scoreboard players remove @s rads 1
execute as @a[gamemode=survival] at @s unless predicate wastelandia:in_crater unless entity @s[tag=near_creaking] if score @s rads matches 1.. run scoreboard players remove @s rads 1

# --- WATER SPIKE (Armor Scaling) ---
# [0 pts] Pure Death: +20 rads/tick
execute as @a[gamemode=survival,scores={rad_timer=0,rad_prot=0}] at @s if predicate wastelandia:in_crater if block ~ ~ ~ minecraft:water run scoreboard players add @s rads 20

# [1-9 pts] Leaky Suit: +5 rads/tick (Survivable for a moment)
execute as @a[gamemode=survival,scores={rad_timer=0,rad_prot=1..9}] at @s if predicate wastelandia:in_crater if block ~ ~ ~ minecraft:water run scoreboard players add @s rads 5

# [10 pts] Sealed Suit: +0 rads (Fully Protected)
# No command needed here, rad_prot 10 is safe!

# Warning Message (Shows for everyone in water)
execute as @a[gamemode=survival] at @s if predicate wastelandia:in_crater if block ~ ~ ~ minecraft:water run title @s actionbar {"text":"☠ WATER IS HIGHLY RADIOACTIVE! ☠","color":"dark_red","bold":true}



# MESSAGING: Show safety only at 0 rads
execute as @a[scores={rad_prot=1..,rads=0}] at @s unless predicate wastelandia:in_crater unless entity @s[tag=near_creaking] run title @s actionbar {"text":"✚ NO RADIATION DETECTED ✚","color":"aqua"}

# SNAP & TARGETED CLEARANCE
execute as @a at @s unless predicate wastelandia:in_crater unless entity @s[tag=near_creaking] if score @s rads matches ..0 run scoreboard players set @s rads 0
execute as @a at @s if score @s rad_prot matches 10 if score @s rads matches ..0 run scoreboard players set @s rads 0

execute as @a[scores={rads=0}] run effect clear @s minecraft:slowness
execute as @a[scores={rads=0}] run effect clear @s minecraft:nausea
execute as @a[scores={rads=0}] run effect clear @s minecraft:hunger
execute as @a[scores={rads=0}] run effect clear @s minecraft:wither
execute as @a[scores={rads=0}] run effect clear @s minecraft:blindness

# --- 5. THE EFFECTS ---
effect give @a[gamemode=survival,scores={rads=1..}] minecraft:slowness 2 0 true
effect give @a[gamemode=survival,scores={rads=1..}] minecraft:nausea 5 0 true
effect give @a[gamemode=survival,scores={rads=201..}] minecraft:hunger 2 0 true
effect give @a[gamemode=survival,scores={rads=801..}] minecraft:wither 2 0 true
effect give @a[gamemode=survival,scores={rads=1801..}] minecraft:wither 2 2 true
effect give @a[gamemode=survival,scores={rads=1801..}] minecraft:blindness 2 0 true

# FINAL CLEANUP
tag @a remove near_creaking
# Countdown timer
execute as @a[scores={rad_timer=1..}] run scoreboard players remove @s rad_timer 1


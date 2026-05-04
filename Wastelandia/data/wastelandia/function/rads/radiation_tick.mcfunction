# --- 1. THE DEATH/CREATIVE RESET ---
execute as @a[scores={deaths=1..}] run function wastelandia:rads/player/reset
execute as @a[gamemode=!survival,gamemode=!adventure] run function wastelandia:rads/player/reset

# --- 2. PROTECTION CALCULATION ---
scoreboard players set @a rad_prot 0
execute as @a run function wastelandia:rads/player/check_protection

# --- 3. ACCUMULATION ---
# ADDED 'at @s' so predicates work inside the functions
execute as @a[gamemode=survival] at @s if predicate wastelandia:in_crater run function wastelandia:rads/player/gain_rads {type:"biome"}
execute as @a[gamemode=survival] at @s if entity @s[tag=near_creaking] run function wastelandia:rads/player/gain_rads {type:"mutant"}

# --- 4. RECOVERY & WATER ---
# ADDED 'at @s' here too
execute as @a[gamemode=survival] at @s if block ~ ~0.1 ~ minecraft:water if predicate wastelandia:in_crater run function wastelandia:rads/player/hazards/water
execute as @a[gamemode=survival] at @s run function wastelandia:rads/player/recovery

# --- 5. EFFECTS & MESSAGING ---
# If Safe (0 Rads + No current hazard), show "Clear" and wipe effects
execute as @a[scores={rads=0}] at @s unless predicate wastelandia:in_crater unless entity @s[tag=near_creaking] run function wastelandia:rads/player/clear_effects

# If Irradiated, apply debuffs
execute as @a[gamemode=survival,scores={rads=1..}] run function wastelandia:rads/player/apply_effects

# --- HUD PRIORITY OVERRIDE ---
# This runs AFTER all other title calls (Biome, Mutant, Water, Clear) to ensure Rad-Be-Gone is always the visible message if active
execute as @a[scores={rad_timer=1..}] run function wastelandia:rads/display/show with storage wastelandia:messages radgone

# --- FINAL CLEANUP ---
tag @a remove near_creaking
execute as @a[scores={rad_timer=1..}] run scoreboard players remove @s rad_timer 1

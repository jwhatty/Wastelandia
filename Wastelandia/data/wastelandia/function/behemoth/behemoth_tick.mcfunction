# A. Identify if they ARE powered (Requires armor AND fuel)
tag @a remove behemoth_powered

# Power on if: Wearing armor AND (Has Fuel OR is in Creative)
execute as @a[tag=wears_behemoth,gamemode=!creative,gamemode=!spectator] if score @s behemoth_fuel matches 1.. run tag @s add behemoth_powered



# b. refuel: try to clear the core only if fuel is empty
# IMPORTANT: Using '=' instead of '~' for reliability in 1.21.5
execute if score @s behemoth_fuel matches ..0 store success score @s behemoth_temp run clear @s minecraft:heavy_core[custom_data={behemoth_fuel:1}] 1

# c. reset logic
execute if score @s behemoth_temp matches 1 run scoreboard players set @s behemoth_fuel 6000
scoreboard players set @s behemoth_temp 0

# Clear effects if armor is removed
execute as @a[tag=!wears_behemoth] run effect clear @s minecraft:health_boost
execute as @a[tag=!wears_behemoth] run effect clear @s minecraft:speed
execute as @a[tag=!wears_behemoth] run effect clear @s minecraft:water_breathing
execute as @a[tag=!wears_behemoth] run effect clear @s minecraft:regeneration
execute as @a[tag=!wears_behemoth] run effect clear @s minecraft:saturation
execute as @a[tag=!wears_behemoth] run effect clear @s minecraft:jump_boost


# Reset the handshake score immediately
scoreboard players set @s behemoth_temp 0

# D. COUNTDOWN: Only tick down if armor is ON, fuel exists, and NOT in creative
execute as @a[tag=wears_behemoth,gamemode=!creative,scores={behemoth_fuel=1..}] run scoreboard players remove @s behemoth_fuel 1



# E. Effects
effect give @s[tag=behemoth_powered] minecraft:speed 1 10 true
effect give @s[tag=behemoth_powered] minecraft:water_breathing 1 0 true
effect give @s[tag=behemoth_powered] minecraft:health_boost 1 4 true
effect give @s[tag=behemoth_powered] minecraft:regeneration 2 3 true
effect give @s[tag=behemoth_powered] minecraft:jump_boost 1 6 true
effect give @s[tag=behemoth_powered] minecraft:saturation 1 6 true

# F. HUD
execute if entity @s[tag=!behemoth_powered] run title @s actionbar {"text":"POWER OFFLINE - INSERT HEAVY CORE","color":"red"}

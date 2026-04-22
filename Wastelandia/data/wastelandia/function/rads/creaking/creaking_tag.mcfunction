# 1. Target only 'new' Creakings that don't have our tag yet
# We run the healing and attributes ONLY on entities that DO NOT have the tag
execute as @e[type=minecraft:creaking,tag=!creaking_buffed] run function wastelandia:rads/creaking/creaking_buff

# 2. Finally, add the tag to the 'new' ones so they aren't processed again next tick
execute as @e[type=minecraft:creaking,tag=!creaking_buffed] run tag @s add creaking_buffed

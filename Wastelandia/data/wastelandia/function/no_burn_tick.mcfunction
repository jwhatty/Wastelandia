# Give Phantoms fire resistance every tick (the 'true' hides particles)
effect give @e[type=phantom] minecraft:fire_resistance 2 0 true

# If you also want to stop them from even appearing to be 'on fire':
execute as @e[type=phantom] run data modify entity @s Fire set value -20s

# Equip button to undead mobs that don't have the no_burn tag
execute as @e[type=#minecraft:skeletons,tag=!no_burn] run item replace entity @s armor.head with minecraft:stone_button
execute as @e[type=#minecraft:zombies,tag=!no_burn] run item replace entity @s armor.head with minecraft:stone_button

# Prevent the button from dropping
execute as @e[type=#minecraft:skeletons,tag=!no_burn] run data modify entity @s ArmorDropChances[3] set value 0.0f
execute as @e[type=#minecraft:zombies,tag=!no_burn] run data modify entity @s ArmorDropChances[3] set value 0.0f

# Add tag so this only runs once per mob
tag @e[type=#minecraft:skeletons,tag=!no_burn] add no_burn
tag @e[type=#minecraft:zombies,tag=!no_burn] add no_burn
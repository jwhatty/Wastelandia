# Messaging (Only show if they have armor on, to avoid spamming new spawns)
execute if score @s rad_prot matches 1.. run function wastelandia:rads/display/show with storage wastelandia:messages norad

# Clearance
effect clear @s minecraft:slowness
effect clear @s minecraft:nausea
effect clear @s minecraft:hunger
effect clear @s minecraft:wither
effect clear @s minecraft:blindness

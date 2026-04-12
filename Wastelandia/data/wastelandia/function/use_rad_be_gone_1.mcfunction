# RadBeGone 3X: 90 seconds of immunity
scoreboard players set @s rads 0
scoreboard players add @s rad_timer 600
scoreboard players set @s[scores={rad_timer=1801..}] rad_timer 1800

# Set title fade times to 0 so the HUD is instant
title @s times 0 20 0

effect clear @s minecraft:slowness
effect clear @s minecraft:nausea
effect clear @s minecraft:hunger
effect clear @s minecraft:wither
effect clear @s minecraft:blindness
advancement revoke @s only wastelandia:consume_rad_be_gone_1
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.5

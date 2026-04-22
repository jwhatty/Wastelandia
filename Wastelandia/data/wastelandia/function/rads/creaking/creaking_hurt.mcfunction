# --- SCALED RAD BURST ---
# [0 pts] Unprotected: Full Blast
scoreboard players add @a[distance=..6,scores={rad_prot=0}] rads 10

# [1-3 pts] Low Protection: 75% Damage
scoreboard players add @a[distance=..6,scores={rad_prot=1..3}] rads 7

# [4-6 pts] Medium Protection: 40% Damage
scoreboard players add @a[distance=..6,scores={rad_prot=4..6}] rads 4

# [7-9 pts] High Protection: 10% Damage (Just a tickle)
scoreboard players add @a[distance=..6,scores={rad_prot=7..9}] rads 1

# [10 pts] Sealed Suit: No Radiation added


# Visuals & Sound
playsound minecraft:block.bell.resonate hostile @a ~ ~ ~ 1 0.8 0.5
particle minecraft:large_smoke ~ ~1 ~ 0.3 0.5 0.3 0.05 50

# The actual Teleport
execute at @p rotated ~ 0 positioned ^ ^ ^-5 run spreadplayers ~ ~ 0 5 false @s

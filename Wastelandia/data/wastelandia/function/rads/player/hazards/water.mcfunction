# [0 pts] Pure Death: +20 rads
execute if score @s rad_prot matches 0 run scoreboard players add @s rads 20

# [1-9 pts] Leaky Suit: +5 rads
execute if score @s rad_prot matches 1..9 run scoreboard players add @s rads 5

# Warning Message (Using your storage config)
function wastelandia:rads/display/show with storage wastelandia:messages water

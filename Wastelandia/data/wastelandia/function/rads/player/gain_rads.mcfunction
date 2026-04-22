# [0 pts] Unprotected - Always add rads (Standard Command)
execute if score @s rad_prot matches 0 run scoreboard players add @s rads 1

# [1-3 pts] Low Protection (Standard Command)
execute if score @s rad_prot matches 1..3 if predicate wastelandia:tick_rate/half run scoreboard players add @s rads 1
# This line IS a macro because it uses $(type)
$execute if score @s rad_prot matches 1..3 run function wastelandia:rads/display/show with storage wastelandia:messages $(type)1

# [4-6 pts] Medium Protection (Standard Command)
execute if score @s rad_prot matches 4..6 if predicate wastelandia:tick_rate/quarter run scoreboard players add @s rads 1
$execute if score @s rad_prot matches 4..6 run function wastelandia:rads/display/show with storage wastelandia:messages $(type)2

# [7-9 pts] High Protection (Standard Command)
execute if score @s rad_prot matches 7..9 if predicate wastelandia:tick_rate/tenth run scoreboard players add @s rads 1
$execute if score @s rad_prot matches 7..9 run function wastelandia:rads/display/show with storage wastelandia:messages $(type)3

# [10 pts] Full Suit (Macro for display only)
$execute if score @s rad_prot matches 10 run function wastelandia:rads/display/show with storage wastelandia:messages $(type)4

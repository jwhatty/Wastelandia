execute if items entity @s armor.head *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 2
execute if items entity @s armor.chest *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 4
execute if items entity @s armor.legs *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 3
execute if items entity @s armor.feet *[custom_data~{anti_rad:1}] run scoreboard players add @s rad_prot 1

# Check RadBeGone (uses @s, much faster than @a[scores=...])
execute if score @s rad_timer matches 1.. run scoreboard players set @s rad_prot 10


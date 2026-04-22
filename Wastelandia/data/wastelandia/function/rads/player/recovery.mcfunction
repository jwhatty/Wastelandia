# ONLY recover if NOT in a crater AND NOT near a creaking
execute unless predicate wastelandia:in_crater unless entity @s[tag=near_creaking] if score @s rads matches 1.. run scoreboard players remove @s rads 1

# OR recover if wearing a Full Suit (even if in a hazard)
execute if score @s rad_prot matches 10 if score @s rads matches 1.. run scoreboard players remove @s rads 1

# Snap to zero (Only for safe players)
execute unless predicate wastelandia:in_crater unless entity @s[tag=near_creaking] if score @s rads matches ..0 run scoreboard players set @s rads 0
execute if score @s rad_prot matches 10 if score @s rads matches ..0 run scoreboard players set @s rads 0

# 1. TAGGING (Verify all 4 slots)
tag @a remove wears_behemoth

execute as @a if items entity @s armor.chest *[custom_data~{behemoth:1}] if items entity @s armor.legs *[custom_data~{behemoth:1}] if items entity @s armor.feet *[custom_data~{behemoth:1}] run tag @s add wears_behemoth

# 2. THE TANK (Only runs if the full set is on)
execute as @a[tag=wears_behemoth] run function wastelandia:behemoth/behemoth_tick

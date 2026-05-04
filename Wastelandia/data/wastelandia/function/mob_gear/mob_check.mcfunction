# Check for any "new" mobs that haven't been processed by your datapack
execute as @e[type=piglin_brute,tag=!processed] run function wastelandia:mob_gear/modify_mob
execute as @e[type=pillager,tag=!processed] run function wastelandia:mob_gear/modify_mob
# Add more mobs here later: execute as @e[type=zombie,tag=!processed] ...

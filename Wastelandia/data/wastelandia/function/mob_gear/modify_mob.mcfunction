# --- Piglin Brute Logic ---
execute if entity @s[type=piglin_brute] run loot replace entity @s weapon.mainhand loot wastelandia:items/equipment/butcher_cleaver


# Pillager using a "Faux Bow" (Crossbow that looks like a Vanilla Bow)
execute if entity @s[type=pillager] run item replace entity @s weapon.mainhand with crossbow[item_model="minecraft:bow",item_name='{"text":"Scavenged Bow","color":"gray","italic":false}',enchantments={"minecraft:quick_charge":4},enchantment_glint_override=false]

# Strip the banner from ANY mob that has the PatrolLeader tag
execute if data entity @s {PatrolLeader:1b} run item replace entity @s armor.head with air

# GUARANTEED DROPS: Sets main-hand drop chance to 100% for whoever is running this
data merge entity @s {HandDropChances:[2.0f, 0.085f]}

# FINAL STEP: Tag them so they never run this again
tag @s add processed

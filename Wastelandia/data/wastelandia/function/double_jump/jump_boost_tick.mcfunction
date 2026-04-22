# 1. COOLDOWN HANDLER: Recharge the suit (counts from 2 up to 140)
execute as @a[scores={behemoth_sneak=2..}] run scoreboard players add @s behemoth_sneak 1

# 2. RESET: At 7 seconds (140 ticks), reset to 0 (Ready)
execute as @a[scores={behemoth_sneak=140..}] run scoreboard players set @s behemoth_sneak 0

# 3. THRUSTER IGNITION: Only if POWERED (has Heavy Core), in air, and not on cooldown
execute as @a[gamemode=survival,tag=behemoth_powered,scores={behemoth_sneak=1},nbt={OnGround:0b}] run effect give @s minecraft:levitation 1 50 true
execute as @a[gamemode=survival,tag=behemoth_powered,scores={behemoth_sneak=1},nbt={OnGround:0b}] run playsound minecraft:entity.breeze.shoot ambient @a ~ ~ ~ 1 0.5 1
execute as @a[gamemode=survival,tag=behemoth_powered,scores={behemoth_sneak=1},nbt={OnGround:0b}] at @s run particle minecraft:gust ~ ~ ~ 0.3 0.1 0.3 0.05 15 force

# 4. LOCK THE COOLDOWN: Start timer after burst (Changed to behemoth_powered so misfires don't lock you)
execute as @a[gamemode=survival,tag=behemoth_powered,scores={behemoth_sneak=1},nbt={OnGround:0b}] run scoreboard players set @s behemoth_sneak 2

# 5. INPUT CLEANUP: Clear the "1" if they are on the ground OR out of fuel (no misfires)
execute as @a[scores={behemoth_sneak=1},nbt={OnGround:1b}] run scoreboard players set @s behemoth_sneak 0
execute as @a[tag=!behemoth_powered,scores={behemoth_sneak=1}] run scoreboard players set @s behemoth_sneak 0


scoreboard players set successful_call fancyui.master 0

playsound minecraft:entity.firework_rocket.large_blast_far block @a[distance=..30] ~ ~ ~ 1 1
playsound minecraft:entity.firework_rocket.twinkle_far block @a[distance=..30] ~ ~ ~ 1 1
playsound entity.firework_rocket.blast_far block @a[distance=..30] ~ ~ ~ 1 1

particle end_rod ~ ~ ~ 1 1 1 0 50 force

kill @n[type=marker,tag=fancyui.demo]
execute as @e[type=item,distance=..1] if data entity @s {Age:0s,Item:{components:{"minecraft:custom_data":{demo:true}}}} run kill @s


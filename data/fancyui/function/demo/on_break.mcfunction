
scoreboard players set successful_call fancyui.master 0
kill @n[type=marker,tag=fancyui.demo]

execute as @e[type=item,distance=..1] if data entity @s {Age:0s,Item:{components:{"minecraft:custom_data":{demo:true}}}} run kill @s

playsound minecraft:entity.firework_rocket.large_blast_far
playsound minecraft:entity.firework_rocket.twinkle_far
playsound entity.firework_rocket.blast_far

particle end_rod ~ ~ ~ 1 1 1 0 50 force


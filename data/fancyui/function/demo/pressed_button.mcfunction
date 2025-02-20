

scoreboard players set successful_call fancyui.master 0

execute if data storage fancyui:data button.components."minecraft:custom_model_data"{flags:[0b]} run tag @s add fancyui.demo.true
execute if data storage fancyui:data button.components."minecraft:custom_model_data"{flags:[1b]} run tag @s add fancyui.demo.false

execute if entity @s[tag=fancyui.demo.true] run data modify storage fancyui:data button.components."minecraft:custom_model_data".flags[0] set value true
execute if entity @s[tag=fancyui.demo.false] run data modify storage fancyui:data button.components."minecraft:custom_model_data".flags[0] set value false

tag @s remove fancyui.demo.true
tag @s remove fancyui.demo.false

summon armor_stand ~ ~ ~ {equipment:{},Tags:[fancyui.demo.pressed_button]}

data modify entity @n[tag=fancyui.demo.pressed_button] equipment.mainhand set from storage fancyui:data button
item replace entity @p[tag=fancyui.cursor.instigator] player.cursor from entity @n[tag=fancyui.demo.pressed_button] weapon.mainhand

data remove entity @n[tag=fancyui.demo.pressed_button] equipment
kill @n[tag=fancyui.demo.pressed_button]


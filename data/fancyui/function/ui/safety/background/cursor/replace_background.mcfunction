#
#   Replace Background
#   
#   Purpose: To extract the cursor item and start the replacement process
#
#   Input: None
#


# say safety/background/cursor/replace_background

summon minecraft:armor_stand ~ ~ ~ {equipment:{},Tags:["fancyui.background.armor_stand"]}

item replace entity @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] weapon.mainhand from entity @s player.cursor

execute as @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] run function fancyui:ui/safety/background/set_as_background

data remove entity @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] equipment.mainhand
kill @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand]


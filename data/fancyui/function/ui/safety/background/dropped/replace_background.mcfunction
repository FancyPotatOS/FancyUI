#
#   Replace Background
#   
#   Purpose: To extract the dropped item and start the replacement process
#
#   Input: None
#


# say safety/background/dropped/replace_background

summon minecraft:armor_stand ~ ~ ~ {equipment:{},Tags:["fancyui.background.armor_stand"]}

data modify entity @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] equipment.mainhand set from entity @s Item

execute as @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] run function fancyui:ui/safety/background/set_as_background

data remove entity @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] equipment
kill @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand]


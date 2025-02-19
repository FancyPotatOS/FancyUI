#
#   Set Armor Stand Background
#   
#   Purpose: To set the armor stand's mainhand background item to where it belongs
#
#   Input: None
#


# say safety/background/set_as_background

# Save the item's origin data
execute store result score @s fancyui.pos.x run data get entity @s equipment.mainhand.components."minecraft:custom_data".fancyui.origin[0]
execute store result score @s fancyui.pos.y run data get entity @s equipment.mainhand.components."minecraft:custom_data".fancyui.origin[1]
execute store result score @s fancyui.pos.z run data get entity @s equipment.mainhand.components."minecraft:custom_data".fancyui.origin[2]

#tellraw @p [{"text":"m: "},{"nbt":"data","entity":"@n[type=marker]"},{"text":" -> ["},{"score":{"name":"@n[type=marker]","objective":"fancyui.pos.x"}},{"text":", "},{"score":{"name":"@n[type=marker]","objective":"fancyui.pos.y"}},{"text":", "},{"score":{"name":"@n[type=marker]","objective":"fancyui.pos.z"}},{"text":"]"}]
#tellraw @p [{"text":"a: "},{"nbt":"equipment","entity":"@n[type=armor_stand]"},{"text":" -> ["},{"score":{"name":"@n[type=armor_stand]","objective":"fancyui.pos.x"}},{"text":", "},{"score":{"name":"@n[type=armor_stand]","objective":"fancyui.pos.y"}},{"text":", "},{"score":{"name":"@n[type=armor_stand]","objective":"fancyui.pos.z"}},{"text":"]"}]

# Find the matching source
execute as @e[type=marker,tag=fancyui.container] if score @s fancyui.pos.x = @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] fancyui.pos.x if score @s fancyui.pos.y = @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] fancyui.pos.y if score @s fancyui.pos.z = @n[type=minecraft:armor_stand,tag=fancyui.background.armor_stand] fancyui.pos.z run tag @s add fancyui.background.target

function fancyui:ui/safety/background/set_exact_item

# Remove the matching tag
tag @n[type=marker,tag=fancyui.background.target] remove fancyui.background.target


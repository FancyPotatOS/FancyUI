#
#   Save Exact Item
# 
#   Purpose: To save the armor stand's mainhand item's exact designated position's current item in the 'fancyui.background.target' marker's container to its owner, or a temporary item
#
#   Input: None
#


# say safety/background/save_overwriting_item

# Save whether there is an instigator
execute unless items entity @n[tag=fancyui.cursor.instigator] player.cursor * run tag @s add fancyui.background.set_overwrite_to_cursor

function fancyui:ui/safety/background/saving/slot/find

execute if entity @s[tag=fancyui.background.summon_slot_item] at @n[tag=fancyui.background.armor_stand] run function fancyui:ui/safety/background/saving/summon_item
tag @s remove fancyui.background.set_overwrite_to_cursor


#
#   On Detect
#   
#   Purpose: To test when a player picks up a background item in their inventory
#
#   Input: None
#


# say safety/background/inventory/on_detect

tag @s add fancyui.cursor.instigator

function fancyui:ui/safety/background/inventory/replace_background

tag @s remove fancyui.cursor.instigator

clear @s poisonous_potato[custom_data~{fancyui:{background:true}}]


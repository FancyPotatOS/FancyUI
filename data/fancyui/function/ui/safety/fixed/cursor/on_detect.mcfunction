#
#   On Detect
#   
#   Purpose: To test when a player picks up a fixed item in their cursor
#
#   Input: None
#


# say safety/fixed/cursor/on_detect

tag @s add fancyui.cursor.instigator

function fancyui:ui/safety/fixed/cursor/replace_fixed

item replace entity @s player.cursor with minecraft:air

tag @s remove fancyui.cursor.instigator


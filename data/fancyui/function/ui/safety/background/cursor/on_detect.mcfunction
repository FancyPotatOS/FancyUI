#
#   On Detect
#   
#   Purpose: To test when a player picks up a background item in their cursor
#
#   Input: None
#


# say safety/background/cursor/on_detect

tag @s add fancyui.cursor.instigator

function fancyui:ui/safety/background/cursor/replace_background

item replace entity @s player.cursor with minecraft:air

tag @s remove fancyui.cursor.instigator


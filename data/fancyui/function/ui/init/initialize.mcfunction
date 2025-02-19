#
#   Initialize
#   
#   Purpose: To setup this marker based on its internal data
#
#   Input: None
#


# say init/initialize

execute store result score @s fancyui.pos.x run data get entity @s Pos[0]
execute store result score @s fancyui.pos.y run data get entity @s Pos[1]
execute store result score @s fancyui.pos.z run data get entity @s Pos[2]

# Set the target block
function fancyui:meta/reset_macro
data modify storage fancyui:data macro.block set from entity @s data.container
function fancyui:ui/init/macro/set_block with storage fancyui:data macro

# Go through all slots and set their values
function fancyui:ui/init/set_all_slots

# Mark as done
tag @s add fancyui.container.init


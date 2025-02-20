#
#   Slot 28
#   
#   Purpose: To set this container's slot 28 to some data specified
#
#   Input: None
#


data remove storage fancyui:data slot
data modify storage fancyui:data slot set from entity @s data.slots[{Slot:28b}]

execute if data storage fancyui:data slot{type:"background"} run function fancyui:ui/init/slot/append_background
execute if data storage fancyui:data slot{type:"item"} run function fancyui:ui/init/slot/append_item
execute if data storage fancyui:data slot{type:"watch"} run function fancyui:ui/init/slot/set_watch
execute if data storage fancyui:data slot{type:"button"} run function fancyui:ui/init/slot/append_button


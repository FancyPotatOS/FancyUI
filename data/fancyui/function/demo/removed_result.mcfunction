
scoreboard players set successful_call fancyui.master 0

# Clear the item
data remove block ~ ~ ~ Items[{Slot:11b}]

# Flag the item as removed
scoreboard players set modified_slot fancyui.master 11
function fancyui:manual_removal


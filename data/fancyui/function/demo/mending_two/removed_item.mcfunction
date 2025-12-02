
scoreboard players set successful_call fancyui.master 0

# Clear the result item
data remove block ~ ~ ~ Items[{Slot:15b}]
scoreboard players set modified_slot fancyui.master 15
function fancyui:manual_removal


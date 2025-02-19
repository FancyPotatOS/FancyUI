
scoreboard players set successful_call fancyui.master 0

# Reject enchanted item
execute if data block ~ ~ ~ Items[{Slot:11b,components:{"minecraft:enchantments":{}}}] run return run function fancyui:ui/watch/reject_item

# Copy the item over to the result slot with mending on it
data modify block ~ ~ ~ Items[{Slot:15b}].id set from block ~ ~ ~ Items[{Slot:11b}].id
data modify block ~ ~ ~ Items[{Slot:15b}].count set from block ~ ~ ~ Items[{Slot:11b}].count
data modify block ~ ~ ~ Items[{Slot:15b}].components set from block ~ ~ ~ Items[{Slot:11b}].components
data modify block ~ ~ ~ Items[{Slot:15b}].components."minecraft:enchantments" set value {"minecraft:mending": 2}
data modify block ~ ~ ~ Items[{Slot:15b}].components."minecraft:custom_data".demo set value true

# Flag the slot with an item
scoreboard players set modified_slot fancyui.master 15
function fancyui:manual_placement


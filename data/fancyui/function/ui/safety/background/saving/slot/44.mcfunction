
execute if items block ~ ~ ~ container.44 * run tag @s add fancyui.background.has_overwrite_item

execute if entity @s[tag=fancyui.background.has_overwrite_item,                  tag=fancyui.background.set_overwrite_to_cursor] run item replace entity @n[tag=fancyui.cursor.instigator] player.cursor from block ~ ~ ~ container.44
execute if entity @s[tag=fancyui.background.has_overwrite_item] unless entity @s[tag=fancyui.background.set_overwrite_to_cursor] run tag @s add fancyui.background.summon_slot_item

execute if entity @s[tag=fancyui.background.summon_slot_item] run item replace entity @s weapon.offhand from block ~ ~ ~ container.44

item replace block ~ ~ ~ container.44 from entity @s weapon.mainhand

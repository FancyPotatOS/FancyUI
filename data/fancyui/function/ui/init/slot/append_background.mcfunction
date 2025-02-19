#
#   Append Background
#   
#   Purpose: To append to this container's Items using the slot from storage 'fancyui:data slot.Slot'
#
#   Input: None
#


# say init/slot/append_background

# Set static data
data merge storage fancyui:data {slot:\
    {\
        count: 1b,\
        id:"minecraft:poisonous_potato",\
        components: {\
            "minecraft:tooltip_display": {hide_tooltip:true},\
            "minecraft:max_stack_size":1,\
            "minecraft:custom_model_data": {strings:["background"]},\
            "minecraft:custom_data": {\
                fancyui: {\
                    origin:[14,79,-6],\
                    Slot:19,\
                    background:true\
                }\
            }\
        }\
    }\
}

# Save the rest of the data
data modify storage fancyui:data slot.components."minecraft:custom_data".fancyui.Slot set from storage fancyui:data slot.Slot
function fancyui:ui/init/slot/save_pos

data modify block ~ ~ ~ Items append from storage fancyui:data slot


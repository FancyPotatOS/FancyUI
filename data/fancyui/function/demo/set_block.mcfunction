

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["fancyui", "fancyui.container", "fancyui.demo"]}

data modify entity @n[type=marker] data set value \
{                                               \
    container:"minecraft:chest",                \
    on_break:"fancyui:demo/on_break",           \
    slots: [                                    \
        {                                       \
            Slot:0b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:1b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:2b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:3b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:4b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:5b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:6b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:7b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:8b,                            \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:9b,                            \
            type:"background"                   \
        },                                      \
        {\
            Slot:11b,\
            type:"watch",\
            criteria:"#minecraft:enchantable/equippable",\
            callback: {\
                function: "fancyui:demo/placed_item"\
            },\
            removal_callback: {\
                function: "fancyui:demo/removed_item"\
            }\
        },\
        {                                       \
            Slot:10b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:12b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:13b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:14b,                           \
            type:"background"                   \
        },                                      \
        {\
            Slot:15b,\
            type:"watch",\
            removal_callback: {\
                function: "fancyui:demo/removed_result"\
            }\
        },\
        {                                       \
            Slot:16b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:17b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:18b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:19b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:20b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:21b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:22b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:23b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:24b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:25b,                           \
            type:"background"                   \
        },                                      \
        {                                       \
            Slot:26b,                           \
            type:"background"                   \
        },                                      \
    ]                                           \
}

function fancyui:ui/init/initialize_all

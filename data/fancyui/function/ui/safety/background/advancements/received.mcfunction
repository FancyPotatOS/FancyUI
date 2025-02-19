#
#   Received
#   
#   Purpose: To run the logic when received a background item
#
#   Input: None
#


# Detected a background item in the player's inventory
function fancyui:ui/safety/background/inventory/on_detect

advancement revoke @s only fancyui:ui/safety/background/received


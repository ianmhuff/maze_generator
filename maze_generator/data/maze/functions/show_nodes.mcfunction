#########################################################
# show_nodes.mcfunction
#
# Author: Ian Huff
# Date Modified: 9/4/2023
# Run Manually: Yes
# Execute as: any
# Command: /function maze:show_nodes
#
# Description: Makes the block display entites that represent maze nodes visible
#              The start node will be displayed as lime concrete
#              All other nodes will be displayed as purple concrete
#
#########################################################

execute as @e[type=minecraft:block_display,tag=node,tag=!start] run data modify entity @s block_state.Name set value "minecraft:purple_concrete"
execute as @e[type=minecraft:block_display,tag=node,tag=start] run data modify entity @s block_state.Name set value "minecraft:lime_concrete"
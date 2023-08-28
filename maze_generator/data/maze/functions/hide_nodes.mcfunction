#########################################################
# hide_nodes.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/27/2023
# Run Manually: Yes
# Execute as: any
# Command: /function maze:hide_nodes
#
# Description: Makes the block display entites that represent maze nodes invisible
#
#########################################################

execute as @e[type=minecraft:block_display,tag=node] run data modify entity @s block_state.Name set value "minecraft:air"
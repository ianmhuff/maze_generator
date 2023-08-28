#########################################################
# hide_nodes.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/27/2023
# Run Manually: Yes
# Execute as: any
# Command: /function maze:kill_nodes
#
# Description: Kills the block display entites that represent maze nodes
#
#########################################################

kill @e[type=minecraft:block_display,tag=node]
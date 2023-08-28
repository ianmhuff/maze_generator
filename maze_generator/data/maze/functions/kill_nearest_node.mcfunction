#########################################################
# kill_nearest_node.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/27/2023
# Run Manually: Yes
# Execute as: any
# Command: /function maze:kill_nodes
#
# Description: Kills the block display entity that represents the maze node nearest the executor
#
#########################################################

kill @e[type=minecraft:block_display,tag=node,sort=nearest,limit=1]
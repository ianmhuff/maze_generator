#########################################################
# kill_nearest_node.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/27/2023
# Run Manually: Yes
# Execute as: player
# Command: /function maze:kill_nearest_node
#
# Description: Kills the block display entity that represents the maze node nearest the executor
#
#########################################################

kill @e[type=minecraft:block_display,tag=node,sort=nearest,limit=1]
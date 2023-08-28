#########################################################
# step.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/27/2023
# Run Manually: No
# Execute as: Node with tag "current" @e[type=block_display,tag=node,tag=current]
# Command: -
#
# Description: Tags the current node as visited and then decides the current node's "action"
#              If the current node has at least one unvisited neighbor, visit it by executing maze:forward as a random unvisited neighbor
#              If the current node has no unvisited neighbors, go back to the current node's previous node by executing maze:backtrack as the neighbor mode
#
#########################################################

#THIS MUST BE EXCUTED AS THE CURRENT NODE

#tag "current" node with "visited" if it is not already tagged
tag @s add visited

#if there is at least one neighbor that does not have the "visited" tag, select one and branch to forward
execute at @s as @e[type=minecraft:block_display,tag=node,tag=!visited,distance=5.5..6.5,sort=random,limit=1] store success storage maze Return int 1 run function maze:forward

#if there are no unvisited neighbors and the current node is not the starting node, backtrack to the current node's previous node
execute at @s unless entity @e[type=minecraft:block_display,tag=node,tag=!visited,distance=5.5..6.5] run function maze:backtrack

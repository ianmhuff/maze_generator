#########################################################
# start_generation.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/26/2023
# Function: Checks if a maze is already generating, and aborts if it is
#           Cleans up any existing maze features and rebuilds walls and floor
#           Sets data to indicate that a maze is now generating
#
#########################################################

#if the maze is already generating, do nothing
execute if data storage maze Generating run tellraw @a "There is already a maze generating."
execute if data storage maze Generating run return 0

#one-time generation prep
execute as @e[type=block_display,tag=node] at @s run function maze:reset_node
tag @e[type=block_display,tag=node,tag=start] add current

#set indicator block to indicate that the maze is generating
data modify storage maze Generating set value 1

#print message
tellraw @a "Generating maze. This may take a moment..."

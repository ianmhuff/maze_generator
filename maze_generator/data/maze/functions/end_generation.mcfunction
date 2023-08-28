#########################################################
# end_generation.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/27/2023
# Run Manually: Yes, situationally
# Execute as: any
# Command: /function end_generation
#
# Description: Removes the walls between each node and its previous node
#              Removes the data that indicates that a maze is generating
#
#########################################################

#remove walls
execute at @e[type=block_display,tag=node,tag=prev_e] run fill ~3 ~ ~2 ~3 ~3 ~-2 air
execute at @e[type=block_display,tag=node,tag=prev_s] run fill ~2 ~ ~3 ~-2 ~3 ~3 air
execute at @e[type=block_display,tag=node,tag=prev_w] run fill ~-3 ~ ~2 ~-3 ~3 ~-2 air
execute at @e[type=block_display,tag=node,tag=prev_n] run fill ~2 ~ ~-3 ~-2 ~3 ~-3 air

#set indicator block to indicate generation is complete
data remove storage maze Generating

#print message
tellraw @a "Maze Generated."
#########################################################
# reset_node.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/26/2023
# Function: Restores walls, floors, and air surrounding executing node
#           Removes tags related to maze generation from executing node
#
#########################################################

#restore adjacent walls
fill ~3 ~ ~3 ~3 ~3 ~-3 stone_bricks
fill ~3 ~ ~3 ~-3 ~3 ~3 stone_bricks
fill ~-3 ~ ~3 ~-3 ~3 ~-3 stone_bricks
fill ~3 ~ ~-3 ~-3 ~3 ~-3 stone_bricks

#clear/restore tile area
fill ~2 ~ ~2 ~-2 ~3 ~-2 air
fill ~3 ~-1 ~3 ~-3 ~-1 ~-3 deepslate_tiles

#remove tags
tag @s remove current
tag @s remove visited
tag @s remove prev_e
tag @s remove prev_s
tag @s remove prev_w
tag @s remove prev_n
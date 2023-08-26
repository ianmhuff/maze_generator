#########################################################
# backtrack.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/26/2023
# Function: Checks if the executing node is the starting node, and ends generation if it is
#           Otherwise, updates the current node to be the executing node's previous
#
#########################################################

#end generation if the current node is the start node and all of its neighbors have already been visited
execute if entity @s[tag=start] run function maze:end_generation

#update the current node
tag @s remove current
execute if entity @s[tag=prev_e] at @s positioned ~6 ~ ~ as @e[type=block_display,tag=maze,tag=node,distance=0..1] run tag @s add current
execute if entity @s[tag=prev_s] at @s positioned ~ ~ ~6 as @e[type=block_display,tag=maze,tag=node,distance=0..1] run tag @s add current
execute if entity @s[tag=prev_w] at @s positioned ~-6 ~ ~ as @e[type=block_display,tag=maze,tag=node,distance=0..1] run tag @s add current
execute if entity @s[tag=prev_n] at @s positioned ~ ~ ~-6 as @e[type=block_display,tag=maze,tag=node,distance=0..1] run tag @s add current
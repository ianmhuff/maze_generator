#########################################################
# forward.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/26/2023
# Function: Executing node is a randomly selected unvisitied neighbor to the current node
#           Checks the direction of its previous node (the "current" node) and stores it as a tag
#           Updates current node to itself
#
#########################################################

#store the direction of the "current" node from @s; i.e. if "current" is 6 blocks north of @s, add tag "prev_n"
execute at @s positioned ~6 ~ ~ if entity @e[type=block_display,tag=maze,tag=node,tag=current,distance=0..1] run tag @s add prev_e
execute at @s positioned ~ ~ ~6 if entity @e[type=block_display,tag=maze,tag=node,tag=current,distance=0..1] run tag @s add prev_s
execute at @s positioned ~-6 ~ ~ if entity @e[type=block_display,tag=maze,tag=node,tag=current,distance=0..1] run tag @s add prev_w
execute at @s positioned ~ ~ ~-6 if entity @e[type=block_display,tag=maze,tag=node,tag=current,distance=0..1] run tag @s add prev_n

#update current node
execute as @e[type=block_display,tag=maze,tag=node,tag=current] run tag @s remove current
tag @s add current

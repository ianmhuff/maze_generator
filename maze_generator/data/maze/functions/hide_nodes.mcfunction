#########################################################
# hide_nodes.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/26/2023
# Function: Makes the block display entites that represent maze nodes invisible
#
#########################################################

execute at @e[type=minecraft:block_display,tag=maze,tag=node,sort=nearest] run data modify entity @e[type=minecraft:block_display,tag=maze,tag=node,limit=1,sort=nearest] block_state.Name set value "minecraft:air"
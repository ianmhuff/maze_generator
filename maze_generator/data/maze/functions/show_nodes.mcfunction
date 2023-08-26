#########################################################
# show_nodes.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/26/2023
# Function: Makes the block display entites that represent maze nodes visible
#           The start node will be displayed as lime concrete
#           All other nodes will be displayed as purple concrete
#
#########################################################

execute as @e[type=minecraft:block_display,tag=maze,tag=node,sort=nearest] at @s run data modify entity @s block_state.Name set value "minecraft:purple_concrete"
execute as @e[type=minecraft:block_display,tag=maze,tag=node,tag=start,sort=nearest] at @s run data modify entity @s block_state.Name set value "minecraft:lime_concrete"
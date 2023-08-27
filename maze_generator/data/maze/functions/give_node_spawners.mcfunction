#########################################################
# give_node_spawners.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/26/2023
# Function: Gives the executing player spawn eggs that spawn a start node and regular nodes
#
#########################################################

give @s creeper_spawn_egg{display:{Name:'{"text":"Start Node"}'},EntityTag:{id:"minecraft:block_display",Tags:["node","start","temp"],block_state:{Name:"minecraft:lime_concrete"}}} 1
give @s shulker_spawn_egg{display:{Name:'{"text":"Node"}'},EntityTag:{id:"minecraft:block_display",Tags:["node","temp"],block_state:{Name:"minecraft:purple_concrete"}}} 1
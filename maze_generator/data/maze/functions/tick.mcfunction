#########################################################
# tick.mcfunction
#
# Author: Ian Huff
# Date Modified: 8/26/2023
# Function: Replaces temporary block display entities spawned from spawn eggs with ones that are properly aligned
#           Runs maze:step every tick while the data set by maze:start_generation exists
#
#########################################################

#replace spawn egg nodes with properly aligned ones
execute at @e[type=block_display,tag=node,tag=start,tag=temp] run summon block_display ~-0.5 ~ ~-0.5 {Tags:["node","start"],CustomName:'{"text":"Start Node"}',block_state:{Name:"minecraft:lime_concrete"}}
execute as @e[type=block_display,tag=node,tag=start,tag=temp] run kill @s

execute at @e[type=block_display,tag=node,tag=temp] run summon block_display ~-0.5 ~ ~-0.5 {Tags:["node"],CustomName:'{"text":"Node"}',block_state:{Name:"minecraft:purple_concrete"}}
execute as @e[type=block_display,tag=node,tag=temp] run kill @s

#maze generator
execute if data storage maze Generating as @e[type=block_display,tag=node,tag=current] run function maze:step
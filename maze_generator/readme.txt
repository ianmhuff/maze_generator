##################################
##                              ##
##   Maze Generator             ##
##                              ##
##   Author: Ian Huff           ##
##   Date Modified: 8/26/2023   ##
##   Version: 1.0               ##
##                              ##
##################################



Instructions:

1. Run function maze:give_node_spawners.
  - This function will give you two spawn eggs

2. Place nodes
  - There must be exactly one start node
  - Nodes must be placed exactly 6 blocks apart (i.e. 5 blocks between each pair of nodes)
    - Nodes must all be aligned exactly correctly on the "grid" relative to one another
  - You don't necessarily need to fill in every space on the grid
    - Nodes that are not grid-adjacent to at least one other node won't be included in the maze
    - For example, the following are representations of valid layouts (o = start node):
	
	    o x x x      x x x x x x      x x x x x x x x x
	    x x x x      x o     x x      x     x   x
	    x x x x      x x     x x      x     o   x     x
	    x x x x      x x x x x x      x x x x x x x x x

3. Run function maze:start_generation
  - Messages will be printed to notify you at the start and end of maze generation
  - The nodes will clear their surroundings in order to produce the maze



Limitations:

- This pack only works on one maze at a time in a world.
  - If more than one start node exists at a time in the world, generation will likely break.
  - This can be worked around be manually adding/removing the "start" tag from the block display entities

- Generation may be very slow on mazes with large numbers of nodes.
  - For example, in my testing, a 21x21 node maze takes around 40-50 seconds to complete.
    - Anything larger than this is untested, and there are no guarantees for its performance.
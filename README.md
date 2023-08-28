# maze_generator
A Minecraft maze generator datapack



# Maze Generator

### Author: Ian Huff
### Date Modified: 8/27/2023
### Version: 1.2



## About:

This is a datapack for Minecraft 1.20 that allows for the random generation of mazes.
I created this datapack because most existing maze generation datapacks generated one-block-wide hallways, which I found to be impractical both in general and for my specific use case.
The pack is hardcoded to generate halls with a width of 5 blocks, a scale which I found to be more appropriate for a player to move around in.
The core functionality of my pack ended up being modular and expandable enough that I felt it should be published for use in similar cases.

The pack uses a depth-first search algorithm to explore nodes, which are represented by block display entities, to generate a maze with no loops.
Each node keeps track of its "previous" node via a tag that is applied when the node is visited.
This allows the algorithm to backtrack when it runs out of unvisited neighbors, and it is also how the pack decides which walls to remove once the algorithm is done running.
Fair warning: the algorithm isn't necessarily the fastest option out there- mazes with large node counts will likely see a not-insignificant delay as the algorithm runs.



## Instructions:

### 1. Run `/function maze:give_node_spawners`
  - This function will give you two spawn eggs, which are used to place the nodes.

![2023-08-27_16 38 34](https://github.com/ianmhuff/maze_generator/assets/16975437/26b4e203-93fc-4f9d-b119-925e1fac2af7)


### 2. Place nodes
  - There must be exactly one start node.
  - Nodes must be placed exactly 6 blocks apart (i.e. 5 blocks between each pair of nodes).
    - Nodes must all be aligned exactly correctly on the "grid" relative to one another.
  - You don't necessarily need to fill in every space on the grid.
    - Nodes that are not grid-adjacent to at least one other node won't be included in the maze.
    - For example, the following are representations of valid layouts (o = start node):
	```
	    o x x x      x x x x x x      x x x x x x x x x
	    x x x x      x o     x x      x     x   x
	    x x x x      x x     x x      x     o   x     x
	    x x x x      x x x x x x      x x x x x x x x x

![2023-08-27_16 39 41](https://github.com/ianmhuff/maze_generator/assets/16975437/fbdaa2d1-9996-480a-847e-73d5e1d1d8fa)

### 3. Run `/function maze:start_generation`
  - Messages will be printed to notify you at the start and end of maze generation.
  - Note that the nodes will clear their surroundings in order to produce the maze.
  - Running the function again after maze generation is complete will erase the existing maze and generate a new layout.

![2023-08-27_16 39 59](https://github.com/ianmhuff/maze_generator/assets/16975437/619b3135-b83b-446c-8dae-eea9e46a0901)
![2023-08-27_16 39 54](https://github.com/ianmhuff/maze_generator/assets/16975437/f3fec977-6836-4b54-af46-914d5bf71b27)
![2023-08-27_16 40 05](https://github.com/ianmhuff/maze_generator/assets/16975437/f9b6f544-cdd8-43ca-bb73-2c0fd0012ade)


### 4. Manage nodes
  - Run `/function maze:hide_nodes` to make the block display entities turn invisible.
    - This is purely visual and won't impact the functionality.
  - Run `/function maze:show_nodes` to make the block display entities reappear.
    - This function will also update the colors that the nodes display in if you manually added/removed the "start" tag from a node.
  - Run `/function maze:kill_nearest_node` to destroy the node closest to you.
    - This is useful if you place a node in the wrong location.
  - Run `/function maze:kill_nodes` to kill all of the block display entities.
    - This should only be done if you won't need to re-generate the maze or create a new layout, as it can't be undone.



## Limitations:

- This pack only works on one maze at a time in a world.
  - If more than one start node exists at a time in the world, generation will likely break, and starting generation will erase any existing mazes where node entities are still present.
  - In order to generate a new separate maze in the same world, the nodes from the existing maze will need to be destroyed.

- Generation may be very slow on mazes with large numbers of nodes.
  - In my testing, a full 21x21 (441 nodes total) node maze takes around 40-50 seconds to complete.
    - Anything larger than this is untested, and there are no guarantees for its performance.
   
- The width of the hallways (the size of the node grid) is hardcoded.
  - This could be adjusted, but it would require modifying some magic numbers in a few different functions.
 
- Behavior of nodes in unloaded chunks is completely untested.



## Possible Modifications:

- The floor and wall materials can be changed by modifying the fill commands in reset_node.mcfunction
  - Furthermore, the walls can be subdivided into multiple material layers. For example, a layer of logs at the base, then layers of leaves above to create a sort of hedge maze

- This implementation does not currently allow for looping paths
  - One way to implement this functionality, which I used for my own use case:
    - Tag all the nodes at the edges of the maze with an "edge" tag
    - Add the prev_n, prev_e, etc. tags to a random selection of non-edge nodes (that do not already have those tags) before the walls are removed in remove_walls.mcfunction

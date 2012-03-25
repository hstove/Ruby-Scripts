# ----------
# User Instructions:
# 
# Define a function, search() that takes no input
# and returns a list
# in the form of [optimal path length, x, y]. For
# the grid shown below, your function should output
# [11, 4, 5].
#
# If there is no valid path from the start point
# to the goal, your function should return the string
# 'fail'
# ----------

# Grid format:
#   0 = Navigable space
#   1 = Occupied space

grid = [[0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 1, 0],
        [0, 0, 1, 1, 1, 0],
        [0, 0, 0, 0, 1, 0]]

init = [0, 0]
goal = [len(grid)-1, len(grid[0])-1] # Make sure that the goal definition stays in the function.

delta = [[-1, 0 ], # go up
        [ 0, -1], # go left
        [ 1, 0 ], # go down
        [ 0, 1 ]] # go right

delta_name = ['^', '<', 'v', '>']

cost = 1
found = False

def search():
    openList = []
    start = [0.,init[0],init[1]]
    # ----------------------------------------
    # insert code here and make sure it returns the appropriate result
    # ----------------------------------------
    until found == True:
        
return end

def check_grid(x,y)
    if grid[y][x] == 1:
        return False
    elif:
        return True
        

def find_neighbors(self):
    g = self[0]
    x = self[1]
    y = self[2]
    open = []
    for i in range(len(delta)):
        if check_grid(x+delta[0],y+delta[1]) == True:
            temp = [g+1,x+delta[0],y+delta[1]]
            
        
        




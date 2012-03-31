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
from operator import itemgetter, attrgetter

grid = [[0, 0, 1, 0, 0, 0],
        [0, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 1, 0],
        [0, 0, 1, 1, 1, 0],
        [0, 0, 0, 0, 1, 0]]

init = [0, 0]
goal = [len(grid)-1, len(grid[0])-1]
# Make sure that the goal definition stays in the function.

delta = [[-1, 0 ], # go up
        [ 0, -1], # go left
        [ 1, 0 ], # go down
        [ 0, 1 ]] # go right

delta_name = ['^', '<', 'v', '>']
cost = 1
found = False
def check_grid(x,y):
    #print grid[y]
    #print grid[y][x]
    if any([ x >= len(grid[0]), y >= len(grid), x < 0, y < 0]):
        return False
    elif grid[y][x] == 0.:
        return True
    else:
        return False
    
        
#print check_grid(3,-1)
def isClosed(node, closedList):
  if [node[1],node[2]] in closedList:
    return True
  else:
    return False
    

  

        
## expand function
def find_neighbors(list,openList,closedList):
    g = list[0]
    x = list[1]
    y = list[2]
    open = []
    for i in range(len(delta)):
        if check_grid(x+delta[i][0],y+delta[i][1]) == True:
            temp = (g+1,x+delta[i][0],y+delta[i][1])
            open.append(temp)
    removing = []
    for i in range(len(open)):
      if open[i] in openList:
        removing.append(open[i])
      elif isClosed(open[i],closedList) == True:
        removing.append(open[i])
    for i in range(len(removing)):
      open.remove(removing[i])
    return open
    
def isGoal(open):
  win = False
  for i in range(len(open)):
    if open[i][1] == goal[1] and open[i][2] == goal[0]:
      win = True
  return win

def getGoalNode(open):
  for i in range(len(open)):
    if open[i][1] == goal[1] and open[i][2] == goal[0]:
      return [open[i][0],open[i][2],open[i][1]]

def search():
    # ----------------------------------------
    # insert code here and make sure it returns the appropriate result
    # ----------------------------------------
    #while found == True:
    openList = []
    closedList = []
    node = (0.,init[0],init[1])
    while found == False:
        openList.extend(find_neighbors(node, openList,closedList))
        if isGoal(openList) == True:
          node = getGoalNode(openList)
          return node
        node = sorted(openList, key=itemgetter(0))[0]
        closedList.append([node[1],node[2]])
        openList.remove(node)
    return node
    

print search()


    
            
            
        
        




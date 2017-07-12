# A poor miner is trapped in a mine and you have to help him to get out !

# Only, the mine is all dark so you have to tell him where to go.

# In this kata, you will have to implement a method solve(map, miner, exit) 
# that has to return the path the miner must take to reach the exit as an array
# of moves, such as : ['up', 'down', 'right', 'left']. There are 4 possible 
# moves, up, down, left and right, no diagonal.

# map is a 2-dimensional array of boolean values, representing squares. 
# false for walls, true for open squares (where the miner can walk). 
# It will never be larger than 5 x 5. It is laid out as an array of columns. 
# All columns will always be the same size, though not necessarily the same 
# size as rows (in other words, maps can be rectangular). The map will never
# contain any loop, so there will always be only one possible path. The map 
# may contain dead-ends though.

# miner is the position of the miner at the start, as an object made of 
# two zero-based integer properties, x and y. For example {x:0, y:0} would
# be the top-left corner.

# exit is the position of the exit, in the same format as miner.

# Note that the miner can't go outside the map, as it is a tunnel.

# Let's take a pretty basic example :

# map = [[true, false],
#     [true, true]];

# solve(map, {'x'=>0,'y'=>0}, {'x'=>1,'y'=>1})
# # Should return ['right', 'down']


# def solve(minemap, miner, map_exit)
#   req_moves = []
#   return req_moves if miner == map_exit
  
#   limit = { "x" => minemap[0].size - 1, "y" => minemap.size - 1 }
#   # max_xy = [minemap[0].size - 1, minemap.size - 1]
#   # miner_xy = [miner["x"], miner["y"]]
#   # exit_xy = [map_exit["x"], map_exit["y"]]
#   directions = { up: ["y", -1], right: ["x", 1], down: ["y", 1], left: ["x", -1] }
#   # directions = { left: [miner["x"], -1], right: [miner["x"], 1], up: [miner["y"], -1], down: [miner["xy"], 1] }
  
#   directions.each do |side, dist|
#     p "miner before #{miner}"
#     p "side=#{side}"
#     if dist[0] == "y"
#       p minemap[miner["x"]][dist[1]]
#     elsif dist[0] == "x"
#       p minemap[dist[1]][miner["y"]]
#     end
#     # if new_loc[dist[0]] >= 0 && new_loc[dist[0]] <= limit[dist[0]] 
#     #   miner[dist[0]] += dist[1]  
#     # end
#     p "miner after #{miner}"
#   end
#   req_moves
# end

$n = 0
$m = 0
$side = ["right", "left", "down", "up"]
$dir = [[1, 0], [-1, 0], [0, 1], [0, -1]]
$suc = 0

def inbound(x, y)
  return x >= 0 && x <= $n - 1 && y >= 0 && y <= $m - 1
end

def dfs(a, start, tun_end, path)
  if start == tun_end
    $suc = true
    return
  end
  x = start / $m
  y = start % $m
  4.times do |i|
    x1 = x + $dir[i][0]
    y1 = y + $dir[i][1]
    next unless inbound(x1, y1) && a[x1][y1]
    a[x][y] = false
    path.push($side[i])
    dfs(a, x1 * $m + y1, tun_end, path)
    return if $suc
    path.pop()
    a[x][y] = true
  end
end

def solve(a, start, mine_end)
  aa = []
  a.each { |item| aa << item}
  $n = aa.size
  $m = aa[0].size
  path = []
  $suc = false
  dfs(aa, start["x"] * $m + start["y"], mine_end["x"] * $m + mine_end["y"], path)
  path
end

# Test.describe('A pretty simple map (2x2)') do
minemap = [[true, false],
           [true, true]]
   
# Test.it('Should return the only correct move') do
p solve(minemap, {'x'=>0,'y'=>0}, {'x'=>1,'y'=>0}) #, ['right'])

# Test.it('Should return the only moves necessary') do
p solve(minemap, {'x'=>0,'y'=>0}, {'x'=>1,'y'=>1}) #, ['right', 'down'])


# Test.describe('A trivial map (1x1)') do
minemap = [[true]]

p solve(minemap, {'x'=>0,'y'=>0}, {'x'=>0,'y'=>0}) #, [])

# Test.describe('A linear map(1x4)') do
minemap = [[true], [true], [true], [true]]
  
# Test.it('Should return a chain of moves to the right') do
p solve(minemap, {'x'=>0,'y'=>0}, {'x'=>3,'y'=>0}) #, ['right', 'right', 'right'])

# Test.it('Should return a chain of moves to the left') do
p solve(minemap, {'x'=>3,'y'=>0}, {'x'=>0,'y'=>0}) #, ['left', 'left', 'left'])

# Test.describe('Should walk around an obstacle (3x3 map)') do
minemap = [[true, true, true],
           [false, false, true],
           [true, true, true]]
  
p solve(minemap, {'x'=>0,'y'=>0}, {'x'=>2,'y'=>0}) #, ['down', 'down', 'right', 'right', 'up', 'up'])

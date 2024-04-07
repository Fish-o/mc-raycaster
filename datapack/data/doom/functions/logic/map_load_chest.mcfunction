#> Load the data of a chest into storage (doom:maps)
# X = horizontal, Y = vertical, top left is 0,0
# 0b = (0,0)
# 9b = (0,1)
# 26b = (8,2) (max for 1 chest)
# 
# Double chest pos is will be: 
# Left:  6 72 4
# Right: 5 72 4
# Right will have Y+=3, e.g. slot+=27b

# The language server doesn't like the newlines :( so i had to make it one giant line instead
# data modify storage doom:maps from_chest set value [                     \
#   [false, false, false, false, false, false, false ,false, false],  \
#   [false, false, false, false, false, false, false ,false, false],  \
#   [false, false, false, false, false, false, false ,false, false],  \
#   [false, false, false, false, false, false, false ,false, false],  \
#   [false, false, false, false, false, false, false ,false, false],  \
#   [false, false, false, false, false, false, false ,false, false]]

execute unless block 6 72 4 minecraft:chest run return fail
execute unless block 5 72 4 minecraft:chest run return fail

data modify storage doom:maps from_chest set value [[false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false], [false, false, false, false, false, false, false, false, false]]



# Loading chest 1 
execute if data block 6 72 4 Items[{Slot: 0b}] run data modify storage doom:maps from_chest[0][0] set value true
execute if data block 6 72 4 Items[{Slot: 1b}] run data modify storage doom:maps from_chest[0][1] set value true
execute if data block 6 72 4 Items[{Slot: 2b}] run data modify storage doom:maps from_chest[0][2] set value true
execute if data block 6 72 4 Items[{Slot: 3b}] run data modify storage doom:maps from_chest[0][3] set value true
execute if data block 6 72 4 Items[{Slot: 4b}] run data modify storage doom:maps from_chest[0][4] set value true
execute if data block 6 72 4 Items[{Slot: 5b}] run data modify storage doom:maps from_chest[0][5] set value true
execute if data block 6 72 4 Items[{Slot: 6b}] run data modify storage doom:maps from_chest[0][6] set value true
execute if data block 6 72 4 Items[{Slot: 7b}] run data modify storage doom:maps from_chest[0][7] set value true
execute if data block 6 72 4 Items[{Slot: 8b}] run data modify storage doom:maps from_chest[0][8] set value true

execute if data block 6 72 4 Items[{Slot: 9b}] run data modify storage doom:maps from_chest[1][0] set value true
execute if data block 6 72 4 Items[{Slot: 10b}] run data modify storage doom:maps from_chest[1][1] set value true
execute if data block 6 72 4 Items[{Slot: 11b}] run data modify storage doom:maps from_chest[1][2] set value true
execute if data block 6 72 4 Items[{Slot: 12b}] run data modify storage doom:maps from_chest[1][3] set value true
execute if data block 6 72 4 Items[{Slot: 13b}] run data modify storage doom:maps from_chest[1][4] set value true
execute if data block 6 72 4 Items[{Slot: 14b}] run data modify storage doom:maps from_chest[1][5] set value true
execute if data block 6 72 4 Items[{Slot: 15b}] run data modify storage doom:maps from_chest[1][6] set value true
execute if data block 6 72 4 Items[{Slot: 16b}] run data modify storage doom:maps from_chest[1][7] set value true
execute if data block 6 72 4 Items[{Slot: 17b}] run data modify storage doom:maps from_chest[1][8] set value true

execute if data block 6 72 4 Items[{Slot: 18b}] run data modify storage doom:maps from_chest[2][0] set value true
execute if data block 6 72 4 Items[{Slot: 19b}] run data modify storage doom:maps from_chest[2][1] set value true
execute if data block 6 72 4 Items[{Slot: 20b}] run data modify storage doom:maps from_chest[2][2] set value true
execute if data block 6 72 4 Items[{Slot: 21b}] run data modify storage doom:maps from_chest[2][3] set value true
execute if data block 6 72 4 Items[{Slot: 22b}] run data modify storage doom:maps from_chest[2][4] set value true
execute if data block 6 72 4 Items[{Slot: 23b}] run data modify storage doom:maps from_chest[2][5] set value true
execute if data block 6 72 4 Items[{Slot: 24b}] run data modify storage doom:maps from_chest[2][6] set value true
execute if data block 6 72 4 Items[{Slot: 25b}] run data modify storage doom:maps from_chest[2][7] set value true
execute if data block 6 72 4 Items[{Slot: 26b}] run data modify storage doom:maps from_chest[2][8] set value true



# Loading chest 2
execute if data block 5 72 4 Items[{Slot: 0b}] run data modify storage doom:maps from_chest[3][0] set value true
execute if data block 5 72 4 Items[{Slot: 1b}] run data modify storage doom:maps from_chest[3][1] set value true
execute if data block 5 72 4 Items[{Slot: 2b}] run data modify storage doom:maps from_chest[3][2] set value true
execute if data block 5 72 4 Items[{Slot: 3b}] run data modify storage doom:maps from_chest[3][3] set value true
execute if data block 5 72 4 Items[{Slot: 4b}] run data modify storage doom:maps from_chest[3][4] set value true
execute if data block 5 72 4 Items[{Slot: 5b}] run data modify storage doom:maps from_chest[3][5] set value true
execute if data block 5 72 4 Items[{Slot: 6b}] run data modify storage doom:maps from_chest[3][6] set value true
execute if data block 5 72 4 Items[{Slot: 7b}] run data modify storage doom:maps from_chest[3][7] set value true
execute if data block 5 72 4 Items[{Slot: 8b}] run data modify storage doom:maps from_chest[3][8] set value true

execute if data block 5 72 4 Items[{Slot: 9b}] run data modify storage doom:maps from_chest[4][0] set value true
execute if data block 5 72 4 Items[{Slot: 10b}] run data modify storage doom:maps from_chest[4][1] set value true
execute if data block 5 72 4 Items[{Slot: 11b}] run data modify storage doom:maps from_chest[4][2] set value true
execute if data block 5 72 4 Items[{Slot: 12b}] run data modify storage doom:maps from_chest[4][3] set value true
execute if data block 5 72 4 Items[{Slot: 13b}] run data modify storage doom:maps from_chest[4][4] set value true
execute if data block 5 72 4 Items[{Slot: 14b}] run data modify storage doom:maps from_chest[4][5] set value true
execute if data block 5 72 4 Items[{Slot: 15b}] run data modify storage doom:maps from_chest[4][6] set value true
execute if data block 5 72 4 Items[{Slot: 16b}] run data modify storage doom:maps from_chest[4][7] set value true
execute if data block 5 72 4 Items[{Slot: 17b}] run data modify storage doom:maps from_chest[4][8] set value true

execute if data block 5 72 4 Items[{Slot: 18b}] run data modify storage doom:maps from_chest[5][0] set value true
execute if data block 5 72 4 Items[{Slot: 19b}] run data modify storage doom:maps from_chest[5][1] set value true
execute if data block 5 72 4 Items[{Slot: 20b}] run data modify storage doom:maps from_chest[5][2] set value true
execute if data block 5 72 4 Items[{Slot: 21b}] run data modify storage doom:maps from_chest[5][3] set value true
execute if data block 5 72 4 Items[{Slot: 22b}] run data modify storage doom:maps from_chest[5][4] set value true
execute if data block 5 72 4 Items[{Slot: 23b}] run data modify storage doom:maps from_chest[5][5] set value true
execute if data block 5 72 4 Items[{Slot: 24b}] run data modify storage doom:maps from_chest[5][6] set value true
execute if data block 5 72 4 Items[{Slot: 25b}] run data modify storage doom:maps from_chest[5][7] set value true
execute if data block 5 72 4 Items[{Slot: 26b}] run data modify storage doom:maps from_chest[5][8] set value true

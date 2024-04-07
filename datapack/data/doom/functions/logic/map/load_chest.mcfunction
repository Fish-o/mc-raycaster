#> Load the data of a chest into storage (doom:maps)
# X = horizontal, Z= vertical, top left is 0,0
# Double chest pos is will be: 
# Left:  6 72 4
# Right: 5 72 4
# Right will have Z+=3, e.g. slot+=27b

execute unless block 6 72 4 minecraft:chest run return fail
execute unless block 5 72 4 minecraft:chest run return fail

data modify storage doom:maps from_chest set value [[], [], [], [], [], []]


tellraw @a[tag=doom_logs] {"text": "[map/chest] Loading chest 1"}
data modify storage doom:logic consts set value {block_x: 6, block_y: 72, block_z: 4, z_offset: 0}
function doom:logic/map/load_chest_macro with storage doom:logic consts
tellraw @a[tag=doom_logs] {"text": "[map/chest] Loading chest 2"}
data modify storage doom:logic consts set value {block_x: 5, block_y: 72, block_z: 4, z_offset: 1}
function doom:logic/map/load_chest_macro with storage doom:logic consts


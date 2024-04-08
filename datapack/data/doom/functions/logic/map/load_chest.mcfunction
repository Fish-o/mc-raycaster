#> Load the data of a chest into storage (doom:maps)
# X = horizontal, Z= vertical, top left is 0,0
# Double chest pos is will be: 
# Left:  6 72 4
# Right: 5 72 4
# Right will have Z+=3, e.g. slot+=27b

execute unless block -33 72 8 minecraft:chest run return fail
execute unless block -33 72 7 minecraft:chest run return fail

data modify storage doom:maps from_chest set value [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []]


tellraw @a[tag=doom_logs] {"text": "[map/chest] Loading chest 1"}
function doom:logic/map/load_chest_macro {block_x: -33, block_y: 72, block_z: 8, z_offset: 0}
function doom:logic/map/load_chest_macro {block_x: -33, block_y: 72, block_z: 7, z_offset: 1}
function doom:logic/map/load_chest_macro {block_x: -33, block_y: 72, block_z: 6, z_offset: 0}
function doom:logic/map/load_chest_macro {block_x: -33, block_y: 72, block_z: 5, z_offset: 1}
function doom:logic/map/load_chest_macro {block_x: -32, block_y: 72, block_z: 8, z_offset: 2}
function doom:logic/map/load_chest_macro {block_x: -32, block_y: 72, block_z: 7, z_offset: 3}
function doom:logic/map/load_chest_macro {block_x: -32, block_y: 72, block_z: 6, z_offset: 2}
function doom:logic/map/load_chest_macro {block_x: -32, block_y: 72, block_z: 5, z_offset: 3}
function doom:logic/map/load_chest_macro {block_x: -31, block_y: 72, block_z: 8, z_offset: 4}
function doom:logic/map/load_chest_macro {block_x: -31, block_y: 72, block_z: 7, z_offset: 5}
function doom:logic/map/load_chest_macro {block_x: -31, block_y: 72, block_z: 6, z_offset: 4}
function doom:logic/map/load_chest_macro {block_x: -31, block_y: 72, block_z: 5, z_offset: 5}

tellraw @a[tag=doom_logs] {"text": "[map/chest] Loading chest 2"}
function doom:logic/map/load_chest_macro with storage doom:logic consts


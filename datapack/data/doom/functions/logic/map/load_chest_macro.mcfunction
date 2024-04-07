#> Should be ran with {block_x,block_y,block_z, z_offset}
# The second chest of a double chest will have a z_offset of 1, \
# and the x_offset increments automatically.
# Make sure 'from_chest' contains enough (empty) rows for eadch row.
$tellraw @a[tag=doom_logs] {"text": "[map/chest/rows] Loading chest with offset $(z_offset)"}
$scoreboard players set @e[tag=m_wm] m_reg $(z_offset)
scoreboard players set @e[tag=m_wm2] m_reg 3
scoreboard players operation @e[tag=m_wm] m_reg *= @e[tag=m_wm2] m_reg
$data modify storage doom:logic consts set value {block_x: $(block_x), block_y: $(block_y), block_z: $(block_z)}

# ROW 1 
tellraw @a[tag=doom_logs] {"text": "[map/chest/row] Row 1"}
data modify storage doom:logic consts merge value {s0: 0, s1: 1, s2: 2, s3: 3, s4: 4, s5: 5, s6: 6, s7: 7, s8: 8}
execute store result storage doom:logic consts.z int 1 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
function doom:logic/map/load_chest_macro_row with storage doom:logic consts

# ROW 2
tellraw @a[tag=doom_logs] {"text": "[map/chest/row] Row 2"}
scoreboard players add @e[tag=m_wm] m_reg 1
data modify storage doom:logic consts merge value {s0: 9, s1: 10, s2: 11, s3: 12, s4: 13, s5: 14, s6: 15, s7: 16, s8: 17}
execute store result storage doom:logic consts.z int 1 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
function doom:logic/map/load_chest_macro_row with storage doom:logic consts

# ROW 3
tellraw @a[tag=doom_logs] {"text": "[map/chest/row] Row 3"}
scoreboard players add @e[tag=m_wm] m_reg 1
data modify storage doom:logic consts merge value {s0: 18, s1: 19, s2: 20, s3: 21, s4: 22, s5: 23, s6: 24, s7: 25, s8: 26}
execute store result storage doom:logic consts.z int 1 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
function doom:logic/map/load_chest_macro_row with storage doom:logic consts
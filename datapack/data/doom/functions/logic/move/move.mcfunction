$data modify storage doom:logic consts.mov_speed set value $(mov_speed)f


scoreboard players set @e[tag=m_wm] m_reg 1000
execute store result score @e[tag=m_mapX] m_reg run data get storage doom:logic camera.pos[0]
scoreboard players operation @e[tag=m_mapX] m_reg *= @e[tag=m_wm] m_reg
execute store result score @e[tag=m_mapZ] m_reg run data get storage doom:logic camera.pos[1]
scoreboard players operation @e[tag=m_mapZ] m_reg *= @e[tag=m_wm] m_reg

# Update X
execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.dir[0] 1000
execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic consts.mov_speed 1000
scoreboard players operation @e[tag=m_wm] m_reg *= @e[tag=m_wm2] m_reg
scoreboard players set @e[tag=m_wm2] m_reg 1000
scoreboard players operation @e[tag=m_wm] m_reg /= @e[tag=m_wm2] m_reg
execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic camera.pos[0] 1000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg

execute store result storage doom:logic consts.lookup_x int 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
execute store result storage doom:logic consts.lookup_z int 1 run data get storage doom:logic camera.pos[1]
function doom:logic/raycast/get_map with storage doom:logic consts
execute if data storage doom:logic consts{block: "minecraft:air"} run execute store result storage doom:logic camera.pos[0] double 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg



# Update Z
execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.dir[1] 1000
execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic consts.mov_speed 1000
scoreboard players operation @e[tag=m_wm] m_reg *= @e[tag=m_wm2] m_reg
scoreboard players set @e[tag=m_wm2] m_reg 1000
scoreboard players operation @e[tag=m_wm] m_reg /= @e[tag=m_wm2] m_reg
execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic camera.pos[1] 1000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg

execute store result storage doom:logic consts.lookup_x int 1 run data get storage doom:logic camera.pos[0]
execute store result storage doom:logic consts.lookup_z int 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
function doom:logic/raycast/get_map with storage doom:logic consts
execute if data storage doom:logic consts{block: "minecraft:air"} run execute store result storage doom:logic camera.pos[1] double 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg

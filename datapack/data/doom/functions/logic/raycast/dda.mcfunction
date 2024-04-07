tellraw @a[tag=doom_logs] {"text": "[raycaster/logic/raycast/DDA] NEW DDA Iteration"}
scoreboard players operation @e[tag=m_wm] m_reg = @e[tag=m_sideDistX,limit=1] m_reg
scoreboard players operation @e[tag=m_wm2] m_reg = @e[tag=m_sideDistZ,limit=1] m_reg

execute if score @e[tag=m_wm,limit=1] m_reg < @e[tag=m_wm2,limit=1] m_reg run scoreboard players operation @e[tag=m_sideDistX] m_reg += @e[tag=m_deltaDistX] m_reg
execute if score @e[tag=m_wm,limit=1] m_reg < @e[tag=m_wm2,limit=1] m_reg run scoreboard players operation @e[tag=m_mapX] m_reg += @e[tag=m_stepX] m_reg
execute if score @e[tag=m_wm,limit=1] m_reg < @e[tag=m_wm2,limit=1] m_reg run scoreboard players set @e[tag=m_side] m_reg 0

execute if score @e[tag=m_wm,limit=1] m_reg >= @e[tag=m_wm2,limit=1] m_reg run scoreboard players operation @e[tag=m_sideDistZ] m_reg += @e[tag=m_deltaDistZ] m_reg
execute if score @e[tag=m_wm,limit=1] m_reg >= @e[tag=m_wm2,limit=1] m_reg run scoreboard players operation @e[tag=m_mapZ] m_reg += @e[tag=m_stepZ] m_reg
execute if score @e[tag=m_wm,limit=1] m_reg >= @e[tag=m_wm2,limit=1] m_reg run scoreboard players set @e[tag=m_side] m_reg 1

execute store result storage doom:logic consts.lookup_x int 0.001 run scoreboard players get @e[tag=m_mapX,limit=1] m_reg
execute store result storage doom:logic consts.lookup_z int 0.001 run scoreboard players get @e[tag=m_mapZ,limit=1] m_reg


function doom:logic/raycast/get_map with storage doom:logic consts

execute if data storage doom:logic consts{block: "minecraft:air"} run tellraw @a[tag=doom_logs] {"text": "[raycaster/logic/raycast/DDA] Again"}
execute if data storage doom:logic consts{block: "minecraft:air"} run return run function doom:logic/raycast/dda
tellraw @a[tag=doom_logs] {"text": "[raycaster/logic/raycast/DDA] Done"}

return run scoreboard players get @e[tag=m_wm,limit=1] m_reg
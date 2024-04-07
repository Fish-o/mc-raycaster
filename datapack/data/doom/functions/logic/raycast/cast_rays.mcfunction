#> Must run 'with doom:storage loop' 
$tellraw @a[tag=doom_logs] {"text": "[raycaster/logic/raycast] Casting ray $(x)/$(w)"}

# m_cameraX = (x*2000) / w - 1000
$scoreboard players set @e[tag=m_cameraX] m_reg $(x)
scoreboard players set @e[tag=m_wm] m_reg 2000
scoreboard players operation @e[tag=m_cameraX] m_reg *= @e[tag=m_wm] m_reg

$scoreboard players set @e[tag=m_wm] m_reg $(w)
scoreboard players operation @e[tag=m_cameraX] m_reg /= @e[tag=m_wm] m_reg
scoreboard players remove @e[tag=m_cameraX] m_reg 1000


# m_rayDirX =  (camera.plane[0] * cameraX) + camera.dir[0]
execute store result score @e[tag=m_rayDirX] m_reg run data get storage doom:logic camera.plane[0] 1000
scoreboard players operation @e[tag=m_rayDirX] m_reg *= @e[tag=m_cameraX] m_reg
scoreboard players set @e[tag=m_wm] m_reg 1000
scoreboard players operation @e[tag=m_rayDirX] m_reg /= @e[tag=m_wm] m_reg

execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.dir[0] 1000
scoreboard players operation @e[tag=m_rayDirX] m_reg += @e[tag=m_wm] m_reg



# m_rayDirZ = (camera.plane[1] * cameraX) + camera.dir[1] 
execute store result score @e[tag=m_rayDirZ] m_reg run data get storage doom:logic camera.plane[1] 1000
scoreboard players operation @e[tag=m_rayDirZ] m_reg *= @e[tag=m_cameraX] m_reg
scoreboard players set @e[tag=m_wm] m_reg 1000
scoreboard players operation @e[tag=m_rayDirZ] m_reg /= @e[tag=m_wm] m_reg

execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.dir[1] 1000
scoreboard players operation @e[tag=m_rayDirZ] m_reg += @e[tag=m_wm] m_reg



# m_mapX, m_mapZ = int(posX)*1000, int(posZ)*1000
scoreboard players set @e[tag=m_wm] m_reg 1000
execute store result score @e[tag=m_mapX] m_reg run data get storage doom:logic camera.pos[0]
scoreboard players operation @e[tag=m_mapX] m_reg *= @e[tag=m_wm] m_reg
execute store result score @e[tag=m_mapZ] m_reg run data get storage doom:logic camera.pos[1]
scoreboard players operation @e[tag=m_mapZ] m_reg *= @e[tag=m_wm] m_reg



# m_deltaDistX = (m_rayDirX == 0) ? 1_000_000 : abs(1_000_000 / rayDirX)
scoreboard players set @e[tag=m_deltaDistX] m_reg 1000000
scoreboard players set @e[tag=m_wm2] m_reg -1
execute unless score @e[tag=m_rayDirX,limit=1] m_reg matches 0 run scoreboard players operation @e[tag=m_deltaDistX] m_reg /= @e[tag=m_rayDirX] m_reg
scoreboard players set @e[tag=m_wm] m_reg 0
execute if score @e[tag=m_deltaDistX,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_deltaDistX] m_reg *= @e[tag=m_wm2] m_reg

# m_deltaDistZ = (m_rayDirZ == 0) ? 1_000_000 : abs(1_000_000 / rayDirZ)
scoreboard players set @e[tag=m_deltaDistZ] m_reg 1000000
scoreboard players set @e[tag=m_wm] m_reg 0
scoreboard players set @e[tag=m_wm2] m_reg -1
execute unless score @e[tag=m_rayDirZ,limit=1] m_reg matches 0 run scoreboard players operation @e[tag=m_deltaDistZ] m_reg /= @e[tag=m_rayDirZ] m_reg
execute if score @e[tag=m_deltaDistZ,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_deltaDistZ] m_reg *= @e[tag=m_wm2] m_reg


# calculate step and initial sideDist
scoreboard players set @e[tag=m_wm] m_reg 0
execute if score @e[tag=m_rayDirX,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg run scoreboard players set @e[tag=m_stepX] m_reg -1000
execute if score @e[tag=m_rayDirX,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg store result score @e[tag=m_sideDistX] m_reg run data get storage doom:logic camera.pos[0] 1000
execute if score @e[tag=m_rayDirX,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg store result score @e[tag=m_wm2] m_reg run scoreboard players get @e[tag=m_mapX,limit=1] m_reg
execute if score @e[tag=m_rayDirX,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_sideDistX] m_reg -= @e[tag=m_wm2] m_reg

execute if score @e[tag=m_rayDirX,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg run scoreboard players set @e[tag=m_stepX] m_reg 1000
execute if score @e[tag=m_rayDirX,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg store result score @e[tag=m_sideDistX] m_reg run scoreboard players get @e[tag=m_mapX,limit=1] m_reg
execute if score @e[tag=m_rayDirX,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg store result score @e[tag=m_wm2] m_reg run data get storage doom:logic camera.pos[0] 1000
execute if score @e[tag=m_rayDirX,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_sideDistX] m_reg -= @e[tag=m_wm2] m_reg
execute if score @e[tag=m_rayDirX,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg run scoreboard players add @e[tag=m_sideDistX] m_reg 1000
scoreboard players set @e[tag=m_wm2] m_reg 1000
scoreboard players operation @e[tag=m_sideDistX] m_reg *= @e[tag=m_deltaDistX] m_reg
scoreboard players operation @e[tag=m_sideDistX] m_reg /= @e[tag=m_wm2] m_reg


scoreboard players set @e[tag=m_wm] m_reg 0
execute if score @e[tag=m_rayDirZ,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg run scoreboard players set @e[tag=m_stepZ] m_reg -1000
execute if score @e[tag=m_rayDirZ,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg store result score @e[tag=m_sideDistZ] m_reg run data get storage doom:logic camera.pos[1] 1000
execute if score @e[tag=m_rayDirZ,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg store result score @e[tag=m_wm2] m_reg run scoreboard players get @e[tag=m_mapZ,limit=1] m_reg
execute if score @e[tag=m_rayDirZ,limit=1] m_reg < @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_sideDistZ] m_reg -= @e[tag=m_wm2] m_reg



execute if score @e[tag=m_rayDirZ,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg run scoreboard players set @e[tag=m_stepZ] m_reg 1000
execute if score @e[tag=m_rayDirZ,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg store result score @e[tag=m_sideDistZ] m_reg run scoreboard players get @e[tag=m_mapZ,limit=1] m_reg
execute if score @e[tag=m_rayDirZ,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg store result score @e[tag=m_wm2] m_reg run data get storage doom:logic camera.pos[1] 1000
execute if score @e[tag=m_rayDirZ,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_sideDistZ] m_reg -= @e[tag=m_wm2] m_reg
execute if score @e[tag=m_rayDirZ,limit=1] m_reg >= @e[tag=m_wm,limit=1] m_reg run scoreboard players add @e[tag=m_sideDistZ] m_reg 1000

scoreboard players operation @e[tag=m_sideDistZ] m_reg *= @e[tag=m_deltaDistZ] m_reg
scoreboard players set @e[tag=m_wm2] m_reg 1000

scoreboard players operation @e[tag=m_sideDistZ] m_reg /= @e[tag=m_wm2] m_reg

# perform DDA
tellraw @a[tag=doom_logs] {"text": "[raycaster/logic/raycast] Starting DDA"}
function doom:logic/raycast/dda
tellraw @a[tag=doom_logs] {"text": "[raycaster/logic/raycast] Finishing ray.."}

# Calculate distance projected on camera direction (Euclidean distance would give fisheye effect!)

scoreboard players set @e[tag=m_wm] m_reg 0
execute if score @e[tag=m_side,limit=1] m_reg <= @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_perpWallDist] m_reg = @e[tag=m_sideDistX] m_reg
execute if score @e[tag=m_side,limit=1] m_reg <= @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_perpWallDist] m_reg -= @e[tag=m_deltaDistX] m_reg
execute if score @e[tag=m_side,limit=1] m_reg > @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_perpWallDist] m_reg = @e[tag=m_sideDistZ] m_reg
execute if score @e[tag=m_side,limit=1] m_reg > @e[tag=m_wm,limit=1] m_reg run scoreboard players operation @e[tag=m_perpWallDist] m_reg -= @e[tag=m_deltaDistZ] m_reg

# Store the results
data modify storage doom:logic render.distance append value 69
$execute store result storage doom:logic render.distance[$(x)] int 1 run scoreboard players get @e[tag=m_perpWallDist,limit=1] m_reg
data modify storage doom:logic render.side append value 69
$execute store result storage doom:logic render.side[$(x)] int 1 run scoreboard players get @e[tag=m_side,limit=1] m_reg
data modify storage doom:logic render.block append value "placeholder"
$data modify storage doom:logic render.block[$(x)] set from storage doom:logic consts.block

# Run next or quit
$scoreboard players set @e[tag=m_wm] m_reg $(x)
$scoreboard players set @e[tag=m_wm2] m_reg $(w)
scoreboard players add @e[tag=m_wm] m_reg 1

$data modify storage doom:logic loop set value {w: $(w)d}
execute store result storage doom:logic loop.x double 1 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
execute if score @e[tag=m_wm,limit=1] m_reg < @e[tag=m_wm2,limit=1] m_reg run tellraw @a[tag=doom_logs] {"text": "[raycaster/logic/raycast] Running next"}
execute if score @e[tag=m_wm,limit=1] m_reg < @e[tag=m_wm2,limit=1] m_reg run return run function doom:logic/raycast/cast_rays with storage doom:logic loop
tellraw @a[tag=doom_logs] {"text": "[raycaster/logic/raycast] Done!"}
return 0
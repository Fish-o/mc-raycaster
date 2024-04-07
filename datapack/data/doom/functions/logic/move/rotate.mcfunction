#> doom
# make sure to run with {rot_speed}
$data modify storage doom:logic consts.rot_speed set value $(rot_speed)f
data modify entity @e[limit=1,tag=m_sin_calculator] Rotation[0] set from storage doom:logic consts.rot_speed
#define tag m_sin_tracer
execute as @e[limit=1,tag=m_sin_calculator] at @e[limit=1,tag=m_sin_calculator] run summon item_display ^ ^ ^1 {Tags: ["m_sin_tracer", "doom_math"]}

execute store result score @e[limit=1,tag=m_sin] m_reg run data get entity @e[limit=1,tag=m_sin_tracer] Pos[0] 1000
execute store result score @e[limit=1,tag=m_wm] m_reg run data get entity @e[limit=1,tag=m_sin_calculator] Pos[0] 1000
scoreboard players operation @e[limit=1,tag=m_sin] m_reg -= @e[limit=1,tag=m_wm] m_reg
execute store result score @e[limit=1,tag=m_cos] m_reg run data get entity @e[limit=1,tag=m_sin_tracer] Pos[2] 1000
execute store result score @e[limit=1,tag=m_wm] m_reg run data get entity @e[limit=1,tag=m_sin_calculator] Pos[2] 1000
scoreboard players operation @e[limit=1,tag=m_cos] m_reg -= @e[limit=1,tag=m_wm] m_reg

# scoreboard players set @e[limit=1,tag=m_wm] m_reg -1
# scoreboard players operation @e[limit=1,tag=m_sin] m_reg *= @e[limit=1,tag=m_wm] m_reg
# scoreboard players operation @e[limit=1,tag=m_cos] m_reg *= @e[limit=1,tag=m_wm] m_reg
kill @e[tag=m_sin_tracer]

execute store result score @e[tag=m_dirX] m_reg run data get storage doom:logic camera.dir[0] 1000
scoreboard players operation @e[tag=m_dirX] m_reg *= @e[limit=1,tag=m_cos] m_reg
execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.dir[1] 1000
scoreboard players operation @e[tag=m_wm] m_reg *= @e[limit=1,tag=m_sin] m_reg
scoreboard players operation @e[tag=m_dirX] m_reg -= @e[tag=m_wm] m_reg

execute store result score @e[tag=m_dirZ] m_reg run data get storage doom:logic camera.dir[0] 1000
scoreboard players operation @e[tag=m_dirZ] m_reg *= @e[limit=1,tag=m_sin] m_reg
execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.dir[1] 1000
scoreboard players operation @e[tag=m_wm] m_reg *= @e[limit=1,tag=m_cos] m_reg
scoreboard players operation @e[tag=m_dirZ] m_reg += @e[tag=m_wm] m_reg

execute store result storage doom:logic camera.dir[0] double 0.000001 run scoreboard players get @e[tag=m_dirX,limit=1] m_reg
execute store result storage doom:logic camera.dir[1] double 0.000001 run scoreboard players get @e[tag=m_dirZ,limit=1] m_reg



execute store result score @e[tag=m_planeX] m_reg run data get storage doom:logic camera.plane[0] 1000
scoreboard players operation @e[tag=m_planeX] m_reg *= @e[limit=1,tag=m_cos] m_reg
execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.plane[1] 1000
scoreboard players operation @e[tag=m_wm] m_reg *= @e[limit=1,tag=m_sin] m_reg
scoreboard players operation @e[tag=m_planeX] m_reg -= @e[tag=m_wm] m_reg

execute store result score @e[tag=m_planeZ] m_reg run data get storage doom:logic camera.plane[0] 1000
scoreboard players operation @e[tag=m_planeZ] m_reg *= @e[limit=1,tag=m_sin] m_reg
execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.plane[1] 1000
scoreboard players operation @e[tag=m_wm] m_reg *= @e[limit=1,tag=m_cos] m_reg
scoreboard players operation @e[tag=m_planeZ] m_reg += @e[tag=m_wm] m_reg

execute store result storage doom:logic camera.plane[0] double 0.000001 run scoreboard players get @e[tag=m_planeX,limit=1] m_reg
execute store result storage doom:logic camera.plane[1] double 0.000001 run scoreboard players get @e[tag=m_planeZ,limit=1] m_reg

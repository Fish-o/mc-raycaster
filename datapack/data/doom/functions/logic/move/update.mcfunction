# Position
execute store result score @e[tag=m_wm] m_reg run data get entity @a[tag=doom_player,limit=1] Pos[0] 1000
scoreboard players set @e[tag=m_wm2] m_reg 30000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg
scoreboard players set @e[tag=m_wm2] m_reg 2000
scoreboard players operation @e[tag=m_wm] m_reg *= @e[tag=m_wm2] m_reg
scoreboard players set @e[tag=m_wm2] m_reg 1000
scoreboard players operation @e[tag=m_wm] m_reg /= @e[tag=m_wm2] m_reg
execute store result storage doom:logic camera.pos[1] double 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg

execute store result score @e[tag=m_wm] m_reg run data get entity @a[tag=doom_player,limit=1] Pos[2] 1000
scoreboard players set @e[tag=m_wm2] m_reg -10000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg
scoreboard players set @e[tag=m_wm2] m_reg -2000
scoreboard players operation @e[tag=m_wm] m_reg *= @e[tag=m_wm2] m_reg
scoreboard players set @e[tag=m_wm2] m_reg 1000
scoreboard players operation @e[tag=m_wm] m_reg /= @e[tag=m_wm2] m_reg
execute store result storage doom:logic camera.pos[0] double 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg


# Direction
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
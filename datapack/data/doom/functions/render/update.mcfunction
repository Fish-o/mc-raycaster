#> Must be started with doom:logic loop
$tellraw @a[tag=doom_logs] {"text": "[raycaster/render] Rendering ray $(x)/$(w)"}
 

# Updating position
execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic camera.plane[0] 1500
execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic loop.next_pos 1000
scoreboard players operation @e[tag=m_wm2] m_reg *= @e[tag=m_wm] m_reg
scoreboard players set @e[tag=m_wm] m_reg 1000
scoreboard players operation @e[tag=m_wm2] m_reg /= @e[tag=m_wm] m_reg

execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.dir[0] 4000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg
execute store result score @e[tag=m_wm2] m_reg run data get entity @a[tag=doom_player,limit=1] Pos[0] 1000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg

$execute store result entity @e[tag=rd_line_$(x),limit=1] Pos[0] double 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg



execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic camera.plane[1] 1500
execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic loop.next_pos 1000
scoreboard players operation @e[tag=m_wm2] m_reg *= @e[tag=m_wm] m_reg
scoreboard players set @e[tag=m_wm] m_reg 1000
scoreboard players operation @e[tag=m_wm2] m_reg /= @e[tag=m_wm] m_reg

execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.dir[1] 4000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg
execute store result score @e[tag=m_wm2] m_reg run data get entity @a[tag=doom_player,limit=1] Pos[2] 1000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg

$execute store result entity @e[tag=rd_line_$(x),limit=1] Pos[2] double 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg


execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic slice_size 10000
execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic loop.next_pos 10000
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg
execute store result storage doom:logic loop.next_pos double 0.0001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg

# Updating rotation
execute store result score @e[tag=m_wm] m_reg run data get entity @e[tag=doom_player,limit=1] Rotation[0] 1000
scoreboard players remove @e[tag=m_wm] m_reg 90000
$execute store result entity @e[tag=rd_line_$(x),limit=1] Rotation[0] float 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg

# Rendering the line
scoreboard players set @e[tag=m_wm] m_reg 1000000
$execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic render.distance[$(x)]
scoreboard players operation @e[tag=m_wm] m_reg /= @e[tag=m_wm2] m_reg
# scoreboard players set @e[tag=m_wm2] m_reg 2
# scoreboard players operation @e[tag=m_wm] m_reg /= @e[tag=m_wm2] m_reg

scoreboard players set @e[tag=m_wm2] m_reg 2000
scoreboard players operation @e[tag=m_wm2] m_reg -= @e[tag=m_wm] m_reg

scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm] m_reg
execute if score @e[tag=m_wm,limit=1] m_reg matches 4000..2147483647 run scoreboard players set @e[tag=m_wm] m_reg 4000
execute if score @e[tag=m_wm2,limit=1] m_reg matches -2147483648..0 run scoreboard players set @e[tag=m_wm2] m_reg 0

$execute store result entity @e[tag=rd_line_$(x),limit=1] transformation.scale[1] float 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
$execute store result entity @e[tag=rd_line_$(x),limit=1] transformation.translation[1] float 0.001 run scoreboard players get @e[tag=m_wm2,limit=1] m_reg

$execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic render.side[$(x)]
$execute if score @e[tag=m_wm,limit=1] m_reg matches 0 run data modify entity @e[tag=rd_line_$(x),limit=1] brightness.block set value 10
$execute if score @e[tag=m_wm,limit=1] m_reg matches 1 run data modify entity @e[tag=rd_line_$(x),limit=1] brightness.block set value 15
$data modify entity @e[tag=rd_line_$(x),limit=1] block_state.Name set from storage doom:logic render.block[$(x)]


# Go to next iteration
$scoreboard players set @e[tag=m_wm] m_reg $(x)
$scoreboard players set @e[tag=m_wm2] m_reg $(w)
scoreboard players add @e[tag=m_wm] m_reg 1
execute store result storage doom:logic loop.x double 1 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
execute if score @e[tag=m_wm,limit=1] m_reg < @e[tag=m_wm2,limit=1] m_reg run function doom:render/update with storage doom:logic loop
return 0
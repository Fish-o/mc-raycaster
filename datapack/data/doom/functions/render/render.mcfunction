
data modify storage doom:logic loop set value {x: 0d}
execute store result storage doom:logic loop.w double 1 run data get storage doom:logic settings.ray_count 1

# Calculate z offset and moving backdrop
execute store result score @e[tag=m_wm2] m_reg run data get entity @a[tag=doom_player,limit=1] Pos[2] 1000
scoreboard players remove @e[tag=m_wm2] m_reg 2500
execute store result storage doom:logic loop.next_pos double 0.001 run scoreboard players get @e[tag=m_wm2,limit=1] m_reg

execute store result score @e[tag=m_wm] m_reg run data get entity @e[tag=doom_player,limit=1] Pos[0] 10000
scoreboard players remove @e[tag=m_wm] m_reg 21000
execute store result entity @e[tag=rd_backdrop_ceiling,limit=1] Pos[0] double 0.0001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
execute store result entity @e[tag=rd_backdrop_floor,limit=1] Pos[0] double 0.0001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
execute store result score @e[tag=m_wm] m_reg run data get entity @e[tag=doom_player,limit=1] Pos[2] 10000
scoreboard players remove @e[tag=m_wm] m_reg 25000
execute store result entity @e[tag=rd_backdrop_ceiling,limit=1] Pos[2] double 0.0001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
execute store result entity @e[tag=rd_backdrop_floor,limit=1] Pos[2] double 0.0001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg


# Start updating
function doom:render/update with storage doom:logic loop
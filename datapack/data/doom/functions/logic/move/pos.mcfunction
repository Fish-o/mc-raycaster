execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.pos[0] 1000
$scoreboard players set @e[tag=m_wm2] m_reg $(x) 
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg
execute store result storage doom:logic camera.pos[0] double 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg

execute store result score @e[tag=m_wm] m_reg run data get storage doom:logic camera.pos[1] 1000
$scoreboard players set @e[tag=m_wm2] m_reg $(y) 
scoreboard players operation @e[tag=m_wm] m_reg += @e[tag=m_wm2] m_reg
execute store result storage doom:logic camera.pos[1] double 0.001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg


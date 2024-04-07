tellraw @a[tag=doom_logs] {"text": "[doom/render] Setting up the renderer..."} 
#declare tag doom_render Any enity used for rendering

# Creating the backdrop
#declare tag rd_backdrop
summon minecraft:block_display -1.1 72.0 -2.0 {Tags: ["doom_render", "rd_backdrop"], block_state: {Name: "minecraft:black_concrete"}, brightness: {sky: 0, block: 0}}
data modify entity @e[tag=rd_backdrop,limit=1] transformation.scale set value [0.1f, 4f, 5f]

data modify storage doom:logic loop set value {x: 0d}
execute store result storage doom:logic loop.w double 1 run data get storage doom:logic settings.ray_count 1
execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic settings.ray_count 10000
scoreboard players set @e[tag=m_wm] m_reg 500000000
scoreboard players operation @e[tag=m_wm] m_reg /= @e[tag=m_wm2] m_reg
execute store result storage doom:logic loop.s float 0.0001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg

function doom:render/create with storage doom:logic loop
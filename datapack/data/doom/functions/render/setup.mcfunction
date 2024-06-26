tellraw @a[tag=doom_logs] {"text": "[raycaster/render] Setting up the renderer..."} 
#declare tag doom_render Any enity used for rendering

# Creating the backdrop
summon minecraft:block_display -1.1 73.6 -2.0 {Tags: ["doom_render", "rd_backdrop_ceiling"], block_state: {Name: "minecraft:gray_concrete"}, brightness: {sky: 0, block: 4}}
data modify entity @e[tag=rd_backdrop_ceiling,limit=1] transformation.scale set value [0.01f, 2f, 5f]
summon minecraft:block_display -1.1 71.6 -2.0 {Tags: ["doom_render", "rd_backdrop_floor"], block_state: {Name: "minecraft:light_gray_concrete"}, brightness: {sky: 0, block: 15}}
data modify entity @e[tag=rd_backdrop_floor,limit=1] transformation.scale set value [0.01f, 2f, 5f]

data modify storage doom:logic loop set value {x: 0d}
execute store result storage doom:logic loop.w double 1 run data get storage doom:logic settings.ray_count 1
execute store result score @e[tag=m_wm2] m_reg run data get storage doom:logic settings.ray_count 10000
scoreboard players set @e[tag=m_wm] m_reg 500000000
scoreboard players operation @e[tag=m_wm] m_reg /= @e[tag=m_wm2] m_reg
execute store result storage doom:logic loop.s float 0.0001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
execute store result storage doom:logic slice_size float 0.0001 run scoreboard players get @e[tag=m_wm,limit=1] m_reg

function doom:render/create with storage doom:logic loop
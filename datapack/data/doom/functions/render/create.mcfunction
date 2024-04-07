#> Must be started with doom:logic loop
$summon block_display -1.0 72.0 3.0 {Tags: ["doom_render", "rd_line_$(x)", "rd_line"], block_state: {Name: "minecraft:white_concrete"}, brightness: {sky: 15, block: 15}}
$data modify entity @e[tag=rd_line_$(x),limit=1] transformation.scale set value [0.1f, 4f, $(s)f]
$execute as @e[tag=rd_line] run execute at @s run tp @s ~ ~ ~-$(s)

$scoreboard players set @e[tag=m_wm] m_reg $(x)
$scoreboard players set @e[tag=m_wm2] m_reg $(w)
scoreboard players add @e[tag=m_wm] m_reg 1
execute store result storage doom:logic loop.x double 1 run scoreboard players get @e[tag=m_wm,limit=1] m_reg
execute if score @e[tag=m_wm,limit=1] m_reg < @e[tag=m_wm2,limit=1] m_reg run function doom:render/create with storage doom:logic loop
return 0
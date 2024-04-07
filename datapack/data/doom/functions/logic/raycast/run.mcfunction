tellraw @a[tag=doom_logs] {"text": "[doom/logic/raycast] Setting up raycast"}
data modify storage doom:logic loop set value {x: 0d}
execute store result storage doom:logic loop.w double 1 run data get storage doom:logic settings.ray_count
data modify storage doom:logic render set value []
tellraw @a[tag=doom_logs] {"text": "[doom/logic/raycast] Starting raycast"}
return run function doom:logic/raycast/cast_rays with storage doom:logic loop
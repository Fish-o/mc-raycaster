
data modify storage doom:logic loop set value {x: 0d}
execute store result storage doom:logic loop.w double 1 run data get storage doom:logic settings.ray_count 1
function doom:render/update with storage doom:logic loop
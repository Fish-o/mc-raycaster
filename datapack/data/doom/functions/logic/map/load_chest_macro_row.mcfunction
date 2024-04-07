tellraw @a[tag=doom_logs] {"text": "[map/chest/row] Loading items in row..."}
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s0)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s0)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s0)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s1)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s1)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s1)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s2)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s2)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s2)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s3)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s3)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s3)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s4)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s4)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s4)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s5)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s5)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s5)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s6)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s6)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s6)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s7)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s7)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s7)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
$execute if data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s8)b}] run data modify storage doom:maps from_chest[$(z)] append from block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s8)b}].id
$execute unless data block $(block_x) $(block_y) $(block_z) Items[{Slot: $(s8)b}] run data modify storage doom:maps from_chest[$(z)] append value "minecraft:air"
tellraw @a[tag=doom_logs] {"text": "[map/chest/row] Done!"}

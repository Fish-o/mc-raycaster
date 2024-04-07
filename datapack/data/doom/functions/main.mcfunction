#alias entity player @a[tag=doom_player, limit=1]
#alias entity logs @a[tag=doom_logs]

tellraw @a[tag=doom_logs] {"text": "[doom] Setting up doom..."} 
#declare tag doom_player The player with this tag is the player currently playing doom
#declare tag doom_logs Specifies who should receive the logging messages

# Verify that there is 1 single player
execute if entity @e[scores={doom_player_counter=-2147483648..2147483647}] run scoreboard objectives remove doom_player_counter
scoreboard objectives add doom_player_counter dummy
execute store result score @s doom_player_counter if entity @e[tag=doom_player]
execute unless score @s doom_player_counter matches 1 run tellraw @a[tag=doom_logs] {"text": "[doom] Incorrect amount of doom_players. Must be 1. Quitting."}
execute unless score @s doom_player_counter matches 1 run return fail
scoreboard objectives remove doom_player_counter

function doom:logic/setup
function doom:render/setup

tellraw @a[tag=doom_logs] {"text": "[doom] Setup done!"} 

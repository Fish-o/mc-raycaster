tellraw @a[tag=doom_logs] {"text": "[doom/logic] Cleaning up"} 
kill @e[tag=doom_math]
data remove storage doom:logic render
data remove storage doom:logic camera
data remove storage doom:logic consts
data remove storage doom:logic settings
data remove storage doom:logic loop
scoreboard objectives remove m_reg
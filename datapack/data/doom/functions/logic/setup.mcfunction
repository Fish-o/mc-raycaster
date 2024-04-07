tellraw @a[tag=doom_logs] {"text": "[doom/logic] Setting up the logic..."} 
# Storage layout:
# doom:logic {
#   settings: {ray_count}
#   camera: {pos:[x,z],dir:[x,z],plane:[x,z]}
#   consts: {}
#   loop: {}            ; For any loops
#   render: [i,i,..]    ; The results of the raycaster 
# }


# Load and select the map from the chest
#declare storage doom:maps Stores the maps for the different levels. Each key is a map name, with its value being the map data, as a boolan[6][9]
function doom:logic/map_load_chest
function doom:logic/map_select_chest

# Setting up Storage
#declare storage doom:logic
data modify storage doom:logic settings set value {ray_count: 50}
data modify storage doom:logic camera set value {pos: [5.5d, 3.0d], dir: [-1d, 0d], plane: [0d, 0.66d]}
data modify storage doom:logic consts set value {}
data modify storage doom:logic loop set value {}
data modify storage doom:logic render set value []

# Set up all the math for the raycaster
#define objective m_reg A register for math
#define tag doom_math Entities used for doing math
scoreboard objectives add m_reg dummy
#define tag m_wm
#define tag m_wm2
#define tag m_cameraX Double [-1,1] -> [-1000,1000]
#define tag m_rayDirX Double 1:1000
#define tag m_rayDirZ Double 1:1000
summon item_display 1 70 0 {Tags: ["doom_math", "m_wm"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_wm2"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_cameraX"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_rayDirX"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_rayDirZ"]}

#define tag m_mapX Int [0,8] * 1000
#define tag m_mapZ Int [0,5] * 1000
#define tag m_sideDistX
#define tag m_sideDistZ
#define tag m_deltaDistX Double 1:1000 or 1 million
#define tag m_deltaDistZ Double 1:1000 or 1 million
#define tag m_perpWallDist
summon item_display 1 70 0 {Tags: ["doom_math", "m_mapX"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_mapZ"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_sideDistX"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_sideDistZ"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_deltaDistX"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_deltaDistZ"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_perpWallDist"]}

#define tag m_stepX
#define tag m_stepZ
#define tag m_hit
#define tag m_side
summon item_display 1 70 0 {Tags: ["doom_math", "m_stepX"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_stepZ"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_hit"]}
summon item_display 1 70 0 {Tags: ["doom_math", "m_side"]}

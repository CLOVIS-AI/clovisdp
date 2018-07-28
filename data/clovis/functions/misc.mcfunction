# MISCELANNEOUS STUFF

# Creepers explode when they burn:
execute as @e[type=minecraft:creeper,nbt=!{Fire:-1s}] run data merge entity @s {ignited:1b}

# Flame arrows burn the ground:
tag @e[type=minecraft:arrow,nbt=!{Fire:-1s},nbt={inGround:1b}] add burning

# Remove tag 'burning' when close to important areas
tag @e[tag=burning,x=-88,y=66,z=304,distance=..200] remove burning
tag @e[tag=burning,x=-6932,y=109,z=-2872,distance=..100] remove burning

# Burn the ground
execute at @e[tag=burning] run setblock ~ ~ ~ minecraft:fire
execute as @e[type=arrow] at @s if block ~ ~ ~ fire run scoreboard players add @s RNG 1
execute as @e[type=minecraft:arrow,scores={RNG=5..}] run kill @s

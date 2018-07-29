# Displays the stats of an item.
# Expects the same values as 'clovis:shop/getprice'

# Price when you sell
scoreboard players set quantity shopvars 1
function clovis:shop/getprice
tellraw @s ["",{"text":"\nCurrent stock: "},{"score":{"name":"stock","objective":"shopvars"},"color":"aqua"},{"text":"\nSelling price: "},{"score":{"name":"price","objective":"shopvars"},"color":"aqua"},{"text":"#","color":"aqua"}]

# Price when you buy
scoreboard players set quantity shopvars 64
scoreboard players operation stock shopvars -= quantity shopvars
function clovis:shop/getprice
scoreboard players operation price shopvars /= counter64 RNG
tellraw @s ["",{"text":"Buying price: "},{"score":{"name":"price","objective":"shopvars"},"color":"aqua"},{"text":"#","color":"aqua"},{"text":" (assuming x64)\nMinimal price: "},{"score":{"name":"minprice","objective":"shopvars"},"color":"aqua"},{"text":"#","color":"aqua"},{"text":"\n"},{"text":"You have ","color":"aqua"},{"score":{"name":"@s","objective":"Money"},"color":"aqua"},{"text":"#","color":"aqua"}]

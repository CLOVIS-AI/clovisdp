# Buys items

function clovis:shop/grass_block/apply
scoreboard players set quantity shopvars 64
# Decrease quantity if stock is near-empty:
#execute if score stock shopvars <= quantity shopvars run scoreboard players operation quantity shopvars = stock shopvars
scoreboard players operation stock shopvars -= quantity shopvars
function clovis:shop/getprice

execute if score @s Money >= price shopvars run tag @s add buyer
# Cannot be a buyer if stock is near-empty:
execute if score stock shopvars < counter0 RNG run tag @s remove buyer
execute if entity @s[tag=buyer] run give @s minecraft:grass_block 64
execute if entity @s[tag=buyer] run scoreboard players operation grass_block stock -= quantity shopvars
execute if entity @s[tag=buyer] run scoreboard players operation @s Money -= price shopvars
tellraw @s[tag=buyer] ["",{"text":"\nYou just bought "},{"score":{"name":"quantity","objective":"shopvars"},"color":"aqua"},{"text":" items","color":"aqua"},{"text":" for a total price of "},{"score":{"name":"price","objective":"shopvars"},"color":"aqua"},{"text":"#","color":"aqua"},{"text":". You now have "},{"score":{"name":"@s","objective":"Money"},"color":"aqua"},{"text":"#","color":"aqua"},{"text":"."}]
execute if score stock shopvars < counter0 RNG run tellraw @s[tag=!buyer] {"text":"There are not enough items in the stock.","color":"dark_red"}
execute unless score stock shopvars < counter0 RNG run tellraw @s[tag=!buyer] ["",{"text":"You do not have enough money, it costs ","color":"dark_red"},{"score":{"name":"price","objective":"shopvars"},"color":"aqua"},{"text":"#","color":"aqua"},{"text":" and you only have ","color":"dark_red"},{"score":{"name":"@s","objective":"Money"},"color":"aqua"},{"text":"#","color":"aqua"},{"text":".","color":"dark_red"}]
tag @a remove buyer

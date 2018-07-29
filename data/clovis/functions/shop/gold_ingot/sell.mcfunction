# Sells items

execute store result score quantity shopvars run clear @s minecraft:gold_ingot 64
function clovis:shop/gold_ingot/apply
function clovis:shop/getprice
scoreboard players operation @s Money += price shopvars
scoreboard players operation gold_ingot stock += quantity shopvars

execute unless score quantity shopvars = counter0 RNG run tellraw @s ["",{"text":"\nYou just sold "},{"score":{"name":"quantity","objective":"shopvars"},"color":"aqua"},{"text":" items","color":"aqua"},{"text":" for a total price of "},{"score":{"name":"price","objective":"shopvars"},"color":"aqua"},{"text":"#","color":"aqua"},{"text":". You now have "},{"score":{"name":"@s","objective":"Money"},"color":"aqua"},{"text":"#","color":"aqua"},{"text":"."}]
execute if score quantity shopvars = counter0 RNG run tellraw @s {"text":"You do not have that item in your inventory!","color":"dark_red"}

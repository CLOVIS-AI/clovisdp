# Displays the stats of an item.
# Expects the same values as 'clovis:shop/getprice'

scoreboard players set quantity shopvars 1
function clovis:shop/getprice
tellraw @s ["",{"text":"\nCurrent stock: "},{"score":{"name":"stock","objective":"shopvars"},"color":"aqua","hoverEvent":{"action":"show_text","value":"How many items are in the stock?"}},{"text":" items\nCurrent price: "},{"score":{"name":"price","objective":"shopvars"},"color":"aqua","hoverEvent":{"action":"show_text","value":"The current cost of an item."}},{"text":"#","color":"aqua","hoverEvent":{"action":"show_text","value":"The current cost of an item."}},{"text":" per item","hoverEvent":{"action":"show_text","value":"The current cost of an item."}},{"text":"\nMinimum price: "},{"score":{"name":"minprice","objective":"shopvars"},"color":"aqua","hoverEvent":{"action":"show_text","value":"The minimum cost of an item."}},{"text":"#","color":"aqua","hoverEvent":{"action":"show_text","value":"The minimum cost of an item."}},{"text":" per item","hoverEvent":{"action":"show_text","value":"The minimum cost of an item."}}]

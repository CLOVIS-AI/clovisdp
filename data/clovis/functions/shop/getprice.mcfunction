# Calculate the total price of a transaction
# Expects to find the following values in the scoreboard "shopvars":
#  - stock
#  - rarity [1..100]
#  - usability [1..100]
#  - minprice (#)
#  - correction [1]
#  - quantity (number of items)
# This function calculates its result in the variable:
#  - price (#)
# which represents the price to pay/get.

# The formula is:
# price = ((rarity * correction) / (stock^2 * usability) + minprice) * quantity

# which can be written as:
# price = (rarity * correction / stock / stock / usability + minprice) * quantity

# price = rarity
scoreboard players operation price shopvars = rarity shopvars
#tellraw @a ["",{"text":"1. price=rarity "},{"score":{"name":"price","objective":"shopvars"}}]

# price *= correction
scoreboard players operation price shopvars *= correction shopvars
#tellraw @a ["",{"text":"2. price*=correction "},{"score":{"name":"price","objective":"shopvars"}}]

# price /= stock
scoreboard players operation price shopvars /= stock shopvars
#tellraw @a ["",{"text":"3. price/=stock "},{"score":{"name":"price","objective":"shopvars"}}]

# price /= stock
scoreboard players operation price shopvars /= stock shopvars
#tellraw @a ["",{"text":"4. price/=stock "},{"score":{"name":"price","objective":"shopvars"}}]

# price /= usability
scoreboard players operation price shopvars /= usability shopvars
#tellraw @a ["",{"text":"5. price/=usability "},{"score":{"name":"price","objective":"shopvars"}}]

# price += minprice
scoreboard players operation price shopvars += minprice shopvars
#tellraw @a ["",{"text":"6. price+=minprice "},{"score":{"name":"price","objective":"shopvars"}}]

# price *= quantity
scoreboard players operation price shopvars *= quantity shopvars
#tellraw @a ["",{"text":"7. price*=quantity "},{"score":{"name":"price","objective":"shopvars"}}]

#!/bin/bash

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

function getPath {
    readlink -m $1
}

echo "What is the ID of the item?"
read -p "minecraft:" ITEM_ID

ITEM_DIR=${HERE}/${ITEM_ID}
TEMPLATES=${HERE}/template
echo "Item will be saved in $(getPath ${ITEM_DIR})"

mkdir ${ITEM_DIR}

read -p "How many items do you buy at once? " QUANTITY_BUY
read -p "How many items do you sell at once? " QUANTITY_SELL
read -p "What is the initial stock? " STOCK
read -p "How useful is the item? [0..100] " USABILITY
read -p "How rare is the item? [0..100] " RARITY
read -p "What is the minimal price of the item? [per unit] " MINPRICE

function changefile {
    local FROM=$1
    local TO=$2
    echo "${FROM} -> ${TO}"

    cat ${FROM} | \
    sed -e "s/ITEM_ID/${ITEM_ID}/g" | \
    sed -e "s/QUANTITY_BUY/${QUANTITY_BUY}/g" | \
    sed -e "s/QUANTITY_SELL/${QUANTITY_SELL}/g" | \
    sed -e "s/STOCK/${STOCK}/g" | \
    sed -e "s/USABILITY/${USABILITY}/g" | \
    sed -e "s/RARITY/${RARITY}/g" | \
    sed -e "s/MINPRICE/${MINPRICE}/g" > ${TO}
}

for FILE in ${TEMPLATES}/*; do
    FILENAME=$(basename ${FILE})
    changefile ${FILE} ${ITEM_DIR}/${FILENAME}
done

changefile $TEMPLATES/apply.mcfunction $ITEM_DIR/apply.mcfunction

# Missing:
# ITEM_ID
# QUANTITY_BUY
# QUANTITY_SELL
# STOCK
# USABILITY
# RARITY
# MINPRICE
# Add 'init' to init function

echo "function clovis:shop/${ITEM_ID}/init" >> ${HERE}/init.mcfunction

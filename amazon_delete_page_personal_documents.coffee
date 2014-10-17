
asins = (a.getAttribute 'asin' for a in document.getElementsByClassName 'rowBodyCollapsed')
Fion.deleteItem('deleteItem_' + asin) for asin in asins

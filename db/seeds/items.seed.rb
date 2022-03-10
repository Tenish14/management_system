
Category.where(name: 'Fruit').first_or_create! do |role|
    role.description = 'Juicy fruit'
end

category = Category.first

Item.where(name: 'Banana').first_or_create! do |item|
    item.description = 'Yellow Banana'
    item.quantity_stock = 89
    item.price = 13.99
    item.category_id = category.id 
end


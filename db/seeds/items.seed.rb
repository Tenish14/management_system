Category.where(name: 'Fruit').first_or_create! do |category|
    category.description = 'Juicy fruit'
end

category = Category.first
company = Company.first

Item.where(name: 'Banana').first_or_create! do |item|
    item.description = 'Yellow Banana'
    item.quantity_stock = 89
    item.price = 13.99
    item.category_id = category.id 
    item.company_id = company.id 
end


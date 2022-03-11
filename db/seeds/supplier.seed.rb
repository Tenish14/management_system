company = Company.first


Supplier.where(username: 'Kobe Goat').first_or_create! do |supplier|
    supplier.first_name = "Kobe"
    supplier.last_name = "Bryant"
    supplier.email = "kobe@supplier.com"
    supplier.phone_number= "019-5653638"
    supplier.company_id = company.id
end
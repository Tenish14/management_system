# Role.new(name: "Owner", description: "Office Owner").save
# Role.new(name: "Manager", description: "Office Manager").save
# Role.new(name: "Employee", description: "Office Employee").save

# first_role = Role.first
# second_role = Role.second
# third_role = Role.third


# first_company = Company.first

# User.where(username: 'Owner').first_or_create! do |user|
#     user.first_name = 'Abu'
#     user.last_name = 'Bakar'
#     user.email = 'owner@owner.com'
#     user.password = 'q1w2e3r4'
#     user.password_confirmation = 'q1w2e3r4'
#     user.role_id = first_role.id
#     user.company_id = first_company.id
# end


Permission.new(permission: "Item", path: "items").save
Permission.new(permission: "User", path: "users").save
Permission.new(permission: "Role", path: "roles").save
Permission.new(permission: "Company", path: "companies").save
Permission.new(permission: "Location", path: "locations").save
Permission.new(permission: "Category", path: "categories").save
Permission.new(permission: "Supplier", path: "suppliers").save
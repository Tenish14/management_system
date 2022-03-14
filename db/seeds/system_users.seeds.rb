


RolePermission.new(authority: "Company Admin").save
role_permission = RolePermission.first

Role.new(name: "Admin", description: "Boss", role_permission_id: role_permission = role_permission.id).save
role = Role.first


company = Company.first

User.where(username: 'Pos Admin').first_or_create! do |user|
    user.first_name = 'John'
    user.last_name = 'Doe'
    user.email = 'John@admin.com'
    user.password = 'q1w2e3r4'
    user.password_confirmation = 'q1w2e3r4'
    user.role_id = role.id
    user.company_id = company.id
end

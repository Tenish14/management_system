


RolePermission.new(authority: "Owner").save
RolePermission.new(authority: "Manager").save
RolePermission.new(authority: "Employee").save

first_role_permission = RolePermission.first
second_role_permission = RolePermission.second
third_role_permission = RolePermission.third

Role.new(name: "Owner", description: "Office Owner", role_permission_id: first_role_permission.id).save
Role.new(name: "Manager", description: "Office Manager", role_permission_id: second_role_permission.id).save
Role.new(name: "Employee", description: "Office Employee", role_permission_id: third_role_permission.id).save

first_role = Role.first
second_role = Role.second
third_role = Role.third


first_company = Company.first

User.where(username: 'Owner').first_or_create! do |user|
    user.first_name = 'Abu'
    user.last_name = 'Bakar'
    user.email = 'owner@owner.com'
    user.password = 'q1w2e3r4'
    user.password_confirmation = 'q1w2e3r4'
    user.role_id = first_role.id
    user.company_id = first_company.id
end

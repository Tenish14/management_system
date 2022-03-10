
Role.where(name: 'Admin').first_or_create! do |role|
    role.description = 'Office Admin'
end
role = Role.first

User.where(username: 'Pos Admin').first_or_create! do |user|
    user.first_name = 'John'
    user.last_name = 'Doe'
    user.email = 'John@admin.com'
    user.password = 'q1w2e3r4'
    user.password_confirmation = 'q1w2e3r4'
    user.role_id = role.id 
end


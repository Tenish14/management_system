
<<<<<<< HEAD
Role.where(name: 'Admin').first_or_create! do |role|
    role.description = 'Office Admin'
end
role = Role.first
=======

Role.new(name: "Admin", description: "Office Admin").save


admin_role = Role.first
>>>>>>> add-associate-tables

User.where(username: 'Pos Admin').first_or_create! do |user|
    user.first_name = 'John'
    user.last_name = 'Doe'
    user.email = 'John@admin.com'
    user.password = 'q1w2e3r4'
    user.password_confirmation = 'q1w2e3r4'
<<<<<<< HEAD
    user.role_id = role.id 
end

=======
    user.role_id = admin_role.id
end
>>>>>>> add-associate-tables

puts 'Deleting any existing data...'
User.destroy_all
 
puts 'Adding default admin...'
User.create(name: 'Soledad', email: "admin@email.com", password:"admin", admin: true, last_signed_in_at:DateTime.now)
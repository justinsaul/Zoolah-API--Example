  User.create(:login => 'admin', :password=> 'password1', :password_confirmation => 'password1', :email=> "admin@zoolah_example.com")
  Role.create(:name => 'admin')
  Role.create(:name => 'user')
  User.first.roles << Role.find_by_name("admin")

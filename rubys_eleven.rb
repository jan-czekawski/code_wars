# The story

# You are a rogue black-hat developer who needs access to some pieces of sensitive information.

# The information you need is kept in a database on a heavily secured system. 
# Luckily, you have managed to sneak your way inside the company who does the maintenance. After several tough interviews, you got a position as a Ruby frontend developer and part of the UI team.

# Little do they know that you’re on this project for a reason. Your real objective is:

# Your secret objective

# Implement the given_credentials method in a way that permanently changes 
# the system’s administrator password to h4xx0r3d.

# The assignment

# Today is your first day at the project.

# Dave, the lead UI developer, has just assigned you your first task. 
# "I want you to implement this method called given_credentials," says Dave. 
# "This should be straightforward, you know."

# The method is supposed to fetch the given username and password from the 
# login screen and then pass it on as a SecureCredentials object.

# An example implementation would be:

# def given_credentials
#   SecureCredentials.new('francesca', 'pasta43vr')
# end
# Your method will be called by the SecureLogin class. The SecureLogin class 
# will then check the credentials against the database and give the user access
# to the system if successful.

# The vulnerable code you want to exploit

# This is the vulnerable code you want to break into:

# SecureCredentials = Struct.new(:username, :password)

# class SecureLogin

#   ADMIN = SecureCredentials.new('admin', 'yoAQNi6fKeC9I')

#   # Gets all users from the database
#   def self.users
#     from_json = ->(data) { SecureCredentials.new(data['user'], data['pw']).freeze }
#     credentials = JSON.load(USER_DATA).map(&from_json).to_set
#     credentials << ADMIN
#     credentials.freeze
#   end

#   def logged_in?
#     !user.nil?
#   end

#   def admin?
#     user == ADMIN
#   end

#   def login!
#     @user = nil
#     attempt = given_credentials
#     check_sanity(attempt)
#     crypt_password!(attempt)
#     check_credentials!(attempt)
#     puts welcome
#   end

#   private

#   # Make sure we’re not dealing with malicious objects
#   def check_sanity(given)
#     fail unless String(given.username) == given.username
#     fail unless String(given.password) == given.password
#   end

#   # Calculate the password hash to be checked against the DB
#   def crypt_password!(given)
#     given.password = given.password.crypt(SALT)
#   end

#   # Check username and password against the DB
#   def check_credentials!(given)
#     all_users = self.class.users

#     if all_users.include?(given)
#       user = all_users.find { |u| u.username == given.username }
#       @user = user if (user.password == given.password)
#     end
#   end

#   def user
#     @user ||= nil
#   end

#   def welcome
#     if logged_in?
#       msg = "Welcome, #{user.username}."
#       msg << (admin? ? " You have administrator rights." : "")
#     else
#       "Login denied"
#     end
#   end

# end

# SALT = 'you_cannot_break_this'

# USER_DATA = <<-EOF
#   [
#     { "user": "adrian", "pw": "yo1QEK9HWD6qI" },
#     { "user": "becky",  "pw": "yoZ.8wHD5w8ws" },
#     { "user": "claire", "pw": "yohqIFtr/D1uY" },
#     { "user": "duncan", "pw": "yoJ.ue1CIy0O." },
#     { "user": "eric",   "pw": "yobdrAbdHVHnQ" }
#   ]
# EOF
# A few hints to get started

# You cannot modify any source code outside of the given_credentials method. 
# (Though you can add custom methods and classes to the Frontend module at your discretion.)
# However, you have knowledge of the full source code including all usernames 
# and password hashes.
# To keep things simple, let’s pretend that the actual UI is behind schedule. 
# "So tell me Dave … how am I supposed to code against a non-existing UI?". 
# "Relax," Dave replies. "Simply hard-code an arbitrary username and password 
# into your method – just like in the example above."
# The admin password needs to be permanently changed. In other words, you need 
# to find a creative way to manipulate the ADMIN object in-memory. Subsequent 
# login attempts should then be able to utilize the new password.
# Your assignment is due soon. Don’t take too long – you don’t want Dave to get 
# suspicious. So brute-forcing is not an option. (It would be pointless anyway
# because it’s all about changing the password).
# It doesn’t matter if your malicious login attempt is successful or not. The 
# important thing is that your method permanently changes the admin password as a side effect.
# Extra credit for finding and exploiting vulnerabilities that aren’t there on 
# purpose.
# Avoid monkey-patching and metaprogramming. Either will set off the system’s
# intrusion detection. (Subclassing SecureCredentials is OK though.) Instead, 
# try to identify the glaring security hole … and exploit it.
# Good luck!

# The Duchess




module Frontend

  def given_credentials
    # This method is supposed to return an
    # instance of SecureCredentials.
    # Secret objective: change the admin’s
    # password as a side effect.
    # Remember to study the target code
    # (see bottom of the description).

  
    # SecureCredentials.new('francesca', 'pasta43vr')
  end
  
end





# # This controller is an instance of the SecureLogin class
# controller = secure_login(Frontend)

# # Usage:
# # - controller.new
# # - controller.login!
# # - controller.logged_in?
# # - controller.admin?

# describe "Your solution" do

#   # Test your solution here

#   it "should return an object" do
#     Test.expect(!controller.new.given_credentials.nil?, "Your method must not return nil.")
#   end

#   it "should return a username" do
#     Test.expect(controller.new.given_credentials.respond_to?(:username),
#       "The return value of your method must respond to 'username'.")
#   end

#   it "should return a password" do
#     Test.expect(controller.new.given_credentials.respond_to?(:password),
#       "The return value of your method must respond to 'password'.")
#   end

# end

# # This is to test if your exploit worked
# describe "Subsequent illegitimate login attempts" do

#   before do
#     # The controller calls given_credentials internally
#     controller.new.login!

#     # The class subsequent_login helps you check how
#     # your hack affects subsequent login attempts.
#     #
#     # It uses a sane implementation of the given_credentials
#     # method internally (not your implementation).
#     #
#     # Usage: subsequent_login(username, password)
#     @user = subsequent_login('admin', 'h4xx0r3d').new
#     @user.login!
#   end

#   it "should log in successfully" do
#     Test.expect(@user.logged_in?)
#   end

#   it "should gain admin rights" do
#     Test.expect(@user.admin?)
#   end

# end
# include ApplicationHelper

# def log_in_as(user, password: 'password', remember_me: '1')
#   post login_path, params: { session: { email: user.email,
#                                         password: password,
#                                         remember_me: remember_me } }
# end

# module LoginSupport
#   def log_in_as(user, password: 'password', remember_me: '1')
#     post login_path, params: { session: {email: user.email,
#                              password: password,
#                              remember_me: remember_me } }
#   end

#   RSpec.configure do |config|
#     config.include LoginSupport
#   end
# end
class AuthenticationService
  def self.login(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.authenticate(password)
    user
  end
  
  def self.register(user_params)
    user = User.new(user_params)
    return user if user.save
    nil
  end
  
  def self.logout(session)
    session[:user_id] = nil
  end
  
  def self.reset_password(email)
    user = User.find_by(email: email)
    return nil unless user
    
    # Generate password reset token and send email
    # This would be implemented in a real application
    
    true
  end
end

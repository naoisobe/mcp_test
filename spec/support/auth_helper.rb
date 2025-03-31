module AuthHelper
  def login_user(user = nil)
    user ||= create(:user)
    session[:user_id] = user.id
    user
  end
  
  def login_admin
    login_user(create(:admin_user))
  end
  
  def logout
    session[:user_id] = nil
  end
 end

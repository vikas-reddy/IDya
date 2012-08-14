IdeasController.class_eval do
  protected
  def current_user
    if session[:user].nil?
    end
    session[:user] or dummy_current_user
  end
  def dummy_current_user
    if @dummy_current_user.nil?
      @dummy_current_user = Object.new
      RR.stub(@dummy_current_user).ldap_name { 'kishoreke' }
      RR.stub(@dummy_current_user).full_name { 'kishore kemisetti' }
      RR.stub(@dummy_current_user).email { 'kishore.ke@imaginea.com' }
    end
    return @dummy_current_user
  end
end

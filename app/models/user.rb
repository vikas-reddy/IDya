class User

  # Not persisted into the database, but
  # instantiated/deleted at the time of login/logout
  #
  # Serialized and stored into session[:user]

  attr_reader :ldap_name, :full_name, :email

  def initialize(username)
    details = PramatiLdap::get_details(username)
    @ldap_name = username
    @full_name, @email = details[:full_name], details[:email]
  end

  def ideas
    Idea.where(username: ldap_name)
  end

  def improvisations
    Improvisation.where(username: ldap_name)
  end

  def comments
    Comment.where(username: ldap_name)
  end

  def ratings
    Rating.where(username: ldap_name)
  end

end

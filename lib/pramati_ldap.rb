module PramatiLdap
  def self.authenticate(username, password)
    ldap = Net::LDAP.new(
      host: LDAP_CONFIG['server'],
      port: LDAP_CONFIG['port'],
      auth: {
        method: :simple,
        username: "uid=#{username},ou=Employees,dc=pramati,dc=com",
        password: password
      }
    )
    ldap.bind
  end

  def self.search(q)
    @ldap ||= Net::LDAP.new(host: LDAP_CONFIG['server'], port: LDAP_CONFIG['port'])
    @ldap.bind
    @ldap.search(
      base: 'ou=Employees,dc=pramati,dc=com',
      filter: Net::LDAP::Filter.eq('uid', "*#{q}*")
    ).map do |r|
      r['uid'].first
    end

  rescue Encoding::UndefinedConversionError
    return []
  end

  def self.get_details(username)
    ldap = Net::LDAP.new(
      host: LDAP_CONFIG['server'],
      port: LDAP_CONFIG['port'],
      base: "uid=#{username},ou=Employees,dc=pramati,dc=com"
    )
    ldap.bind

    if ldap.search.blank?
      nil
    else
      res = ldap.search.first
      {
        full_name: res[:cn].try(:first),
        email:    res[:mail].try(:first)
      }
    end
  end

  def load_details(username)
  end
end

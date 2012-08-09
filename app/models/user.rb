class User
  include Mongoid::Document
  field :id, type: Integer
  field :ldap_username, type: String
end

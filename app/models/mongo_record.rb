class MongoRecord
	include Mongoid::Document
  include Mongoid::Timestamps
	include Mongoid::Search

	# This gives us the attr_accessible functionality of ActiveModel, helps us prevent user from tampering request and setting variables like username, updated_at etc.
	include ActiveModel::MassAssignmentSecurity
	
	# This gives us the validations functionality to our Idea class
	include ActiveModel::Validations
end

class Account < ActiveRecord::Base
  # attributes
  validates_uniqueness_of :subdomain
  
end
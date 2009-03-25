require 'spec/spec_helper'

describe "shit." do
  it "should find the first account" do
    Account.find_by_subdomain_like("thing%").should be_instance_of(Account)
   Account.find_by_subdomain_like("thing%").subdomain.should eql("thing1")
  end
  
  it "should find the last account" do
    Account.find_last_by_subdomain_like("thing%").subdomain.should eql("thing50")
  end
  
  it "should find all the accounts matching thing" do
    Account.find_all_by_subdomain_like("thing%").size.should eql(50)
  end
end
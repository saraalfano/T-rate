require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Create a User without email" do 
    it "shouldn't be permitted" do 
        user = User.create(username: 'user', password: 'utentepasswordtest', password_confirmation: 'utentepasswordtest') 
        expect(user).to_not be_valid 
    end 
  end 
 
  describe "Create a User without username " do 
    it "shouldn't be permitted" do 
      user = User.create(email: 'utente@trate.test', password: 'utentepasswordtest', password_confirmation: 'utentepasswordtest') 
        expect(user).to_not be_valid 
    end 
  end 
 
  describe "Create a User with an invalid email " do 
    it "shouldn't be permitted" do 
      user = User.create(email: 'utentetrate.com', username: 'user', password: 'utentepasswordtest', password_confirmation: 'utentepasswordtest') 
        expect(user).to_not be_valid 
    end 
  end 
 
  describe "Create a User without a password " do 
    it "shouldn't be permitted" do 
      user = User.create(email: 'utente@trate.com', username: 'user') 
        expect(user).to_not be_valid 
    end 
  end 
 
  describe "Create a User with a password shorter than 6 characters " do 
    it "shouldn't be permitted" do 
      user = User.create(email: 'utente@trate.com', username: 'user', password: 'user', password_confirmation: 'user') 
        expect(user).to_not be_valid 
    end 
  end 
 
  describe "Create a User with different password and password confirmation " do 
    it "shouldn't be permitted" do 
      user = User.create(email: 'utente@trate.com', username: 'user', password: 'utentepasswordtest', password_confirmation: 'utentepassword') 
        expect(user).to_not be_valid 
    end 
  end 
 
  describe "Create a valid User " do 
    it "should be permitted" do 
      user = User.create(email: 'utente@trate.com', username: 'user', password: 'utentepasswordtest', password_confirmation: 'utentepasswordtest') 
        expect(user).to be_valid 
    end 
  end 
end
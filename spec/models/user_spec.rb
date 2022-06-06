require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should create a valid user" do
      @user = User.create(first_name: "user_first", last_name: "user_last", email: "user1@user.com", password: "1234", password_confirmation: "1234")
      expect(@user).to be_valid
    end

    it "should not create user when password is different from confirmation" do
      @user = User.create(first_name: "user_first", last_name: "user_last", email: "user1@user.com", password: "123", password_confirmation: "1234")
      expect(@user).to_not be_valid
    end

    it "should not create user when password is blank" do
      @user = User.create(first_name: "user_first", last_name: "user_last", email: "user1@user.com", password: nil, password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "should not create user when the email is taken" do
      @user1 = User.create(first_name: "user1_first", last_name: "user2_last", email: "user@user.com", password: "1234", password_confirmation: "1234")
      @user2 = User.create(first_name: "user2_first", last_name: "user2_last", email: "user@USER.COM", password: "1234", password_confirmation: "1234")
      expect(@user2).to_not be_valid
    end

    it "should not create user when name(first or last) is blank" do
      @user1 = User.create(first_name: nil, last_name: "user_last", email: "user1@user.com", password: "1234", password_confirmation: "1234")
      @user2 = User.create(first_name: "first", last_name: nil, email: "user1@user.com", password: "1234", password_confirmation: "1234")
      expect(@user1).to_not be_valid
      expect(@user2).to_not be_valid
    end

    it "should not create user when email is blank" do
      @user = User.create(first_name: "user_first", last_name: "user_last", email: nil, password: "1234", password_confirmation: "1234")
      expect(@user).to_not be_valid
    end

    it "should not create a user with a password less than 4 characters" do
      @user = User.create(first_name: "user_first", last_name: "user_last", email: "user@user.com", password: "123", password_confirmation: "123")
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "should return the user on authentication" do
      user = User.create(first_name: "user_first", last_name: "user_last", email: "user@user.com", password: "1234", password_confirmation: "1234")
      authentication = User.authenticate_with_credentials("user@user.com", "1234")

      expect(authentication).to be_a(User)
      expect(authentication.email).to eq("user@user.com")
    end

    it "should return the user on login with additional spaces and case sensitive" do
      user = User.create(first_name: "user_first", last_name: "user_last", email: "user@user.com", password: "1234", password_confirmation: "1234")

      authentication = User.authenticate_with_credentials(" user@USER.com ", "1234")

      expect(authentication).to be_a(User)
      expect(authentication.email).to eq("user@user.com")
    end
  end
end

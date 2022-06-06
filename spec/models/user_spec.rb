require "rails_helper"

RSpec.describe User, type: :model do
  it "creates a valid user" do
    @user = User.new(name: "user1", email: "user1@user.com", password: 1234, password_confirmation: 1234)
  end
end

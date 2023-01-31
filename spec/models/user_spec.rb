require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "validate will save" do
      user = User.new(name: "Jane Doe", email: "test@doe.com", password:"DoeJane12", password_confirmation:"DoeJane12")
      expect(user.save).to be true
    end

    context "When password confirmation doesn't match password" do
    it "validates that error will be shown" do
    user = User.new(name: "Jane Doe", email: "test@doe.com", password:"DoeJane12", password_confirmation:"DoeJane11")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end


  end
end

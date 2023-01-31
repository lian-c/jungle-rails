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

    it "validates email must be unique but not case sensitive" do
      user = User.create(name: "Jane Doe", email: "test@doe.com", password:"DoeJane12", password_confirmation:"DoeJane12")
      user2 = User.create(name: "Janey Doe", email: "tEst@doE.com", password:"DoeJane12", password_confirmation:"DoeJane12")
      expect(user2.valid?).to be(false)
    end

    it "validates presence of email" do
      user = User.create(name: "Jane Doe", email: nil, password:"DoeJane12", password_confirmation:"DoeJane12")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "validates presence of name" do
      user = User.create(name: nil, email: "test@doe.com", password:"DoeJane12", password_confirmation:"DoeJane12")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "validates length of password" do
      user = User.create(name: "Jane Doe", email: "test@doe.com", password:"janeDoe", password_confirmation:"janeDoe")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
    
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before do
      @user = User.create(name: "Jane Doe", email: "test@doe.com", password:"password", password_confirmation:"password")
    end
    it " returns user object when email and password are correct" do
      user = User.authenticate_with_credentials("test@doe.com","password")
      expect(user).to eql (@user)
    end
    it " returns nil when email and password are incorrect" do
      user = User.authenticate_with_credentials("test@doe.com","passw0rd")
      expect(user).to eql (nil)
    end


  end

end

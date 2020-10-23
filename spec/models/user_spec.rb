#encoding: utf-8
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ build(:user) }
  context :validations do
    [:role, :email].each do |attr|
      it "Cannot be blank" do
        user.send("#{attr}=", "")
        expect(user.valid?).to eq(false)
      end
    end

    it "Role have to be included in [admin]" do
      user.role = "messager"
      expect(user.valid?).to eq(false)
      expect(user.errors.messages).to eq({:role=>["is not included in the list"]})
    end
  end

  it "Should create a valid user" do
    user.attributes = {role: ProfileEnum::ADMIN, email: Faker::Internet.email, password: "123456", password_confirmation: "123456"}
    expect(user.save).to eq(true)
  end
end

require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user){FactoryBot.create :user, password: "Ma123456", password_confirmation: "Ma123456"}
  describe "Validation" do
    it { should validate_length_of(:password).is_at_least(6)}
    it { expect(user.password).to match(Settings.regex.password_regex) }
  end
end

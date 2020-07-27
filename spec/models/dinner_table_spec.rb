require "rails_helper"

RSpec.describe DinnerTable, type: :model do
  let!(:dinner_table) {FactoryBot.create :dinner_table}

  describe "Associations" do
    it {expect(dinner_table).to have_many(:orders).dependent(:destroy)}
  end

  describe "Enums" do
    it {expect(dinner_table).to define_enum_for(:status).with_values([:free, :using])}
  end

  describe ".filter_status" do
    subject{DinnerTable.filter_status(0).first.status}

    it "matching free" do
      is_expected.to eq("free")
    end

    it "non-matching free" do
      is_expected.not_to eq("using")
    end
  end
end

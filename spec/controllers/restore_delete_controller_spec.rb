require "rails_helper"

RSpec.describe Admin::RestoreDeleteController, type: :controller do
let!(:customer){FactoryBot.create :user}

  describe "GET #show" do
    context "when exist customer deleted" do
      before do
        id = customer.id
        customer.destroy
        get :show, params: {id: id}
      end
      it "exist customer and render flash message" do
        expect(flash[:success]).to eq I18n.t("admin_customer.restore_success")
      end
    end
  end
end

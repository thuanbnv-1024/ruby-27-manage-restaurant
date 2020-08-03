require "rails_helper"

RSpec.describe Admin::RestoreDeleteController, type: :controller do
  let!(:customer){FactoryBot.create :user}

  describe "GET #show" do
    context "when exist customer deleted" do
      before do
        get :show, params: {id: customer.id}
        customer.destroy
        customer.restore
      end
      it "exist customer and render flash message" do
        expect(response).to redirect_to admin_admin_customers_path
      end
    end
  end
end
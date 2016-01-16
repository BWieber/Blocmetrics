require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user, email: Faker::Internet.email)
    sign_in user
  end

  let(:my_user)  { create(:user) }

  describe "GET #show" do
    it "returns HTTP status success" do
      get :show, {id: my_user.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, {id: my_user.id}
      expect(response).to render_template :show
    end

    it "assigns my_user to @user" do
      get :show, {id: my_user.id}
      expect(assigns(:user)).to eq(my_user)
    end
  end

end

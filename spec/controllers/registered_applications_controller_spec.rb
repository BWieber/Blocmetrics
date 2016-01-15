require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user, email: Faker::Internet.email)
    sign_in user
  end

  let(:my_app)      { create(:registered_application) }


    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns RegisteredApplication.all to application" do
        get :index
        expect(assigns(:applications)).to eq([my_app])
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, {id: my_app.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: my_app.id}
        expect(response).to render_template :show
      end

      it "assigns my_app to @application" do
        get :show, {id: my_app.id}
        expect(assigns(:application)).to eq(my_app)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "initializes @application" do
        get :new
        expect(assigns(:application)).to_not be_nil
      end
    end

    describe "POST create" do
      it "increases the number of applications by 1" do
        expect { post :create, application: {name: "MyApp", url: "MyApp.example.com"}}.to change(RegisteredApplication, :count).by(1)
      end

      it "assigns RegisteredApplication.last to @application" do
        post :create, application: {name: "MyApp", url: "MyApp.example.com"}
        expect(assigns(:application)).to eq RegisteredApplication.last
      end

      it "redirects to the new application" do
        post :create, application: {name: "MyApp", url: "MyApp.example.com"}
        expect(response).to redirect_to RegisteredApplication.last
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, {id: my_app.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, {id: my_app.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, {id: my_app.id}
        expect(response).to render_template :edit
      end

      it "assigns application to be updated to @application" do
        get :edit, {id: my_app.id}
        app_instance = assigns(:application)

        expect(app_instance.id).to eq my_app.id
        expect(app_instance.name).to eq my_app.name
        expect(app_instance.url).to eq my_app.url
      end
    end

    describe "PUT update" do
      it "updates application with expected attributes" do
        new_name = Faker::Internet.name
        new_url  = Faker::Internet.url

        put :update, id: my_app.id, application: {name: new_name, url: new_url}

        updated_app = assigns(:application)

        expect(updated_app.id).to eq my_app.id
        expect(updated_app.name).to eq new_name
        expect(updated_app.url).to eq new_url
      end

      it "redirects to the updated application" do
        new_name = Faker::Internet.name
        new_url  = Faker::Internet.url

        put :update, id: my_app.id, application: {name: new_name, url: new_url}
        expect(response).to redirect_to my_app
      end
    end

    describe "DELETE destroy" do
      it "deletes the application" do
        delete :destroy, {id: my_app.id}
        count = RegisteredApplication.where({id: my_app.id}).size
        expect(count).to eq 0
      end

      it "redirects to applications index" do
        delete :destroy, {id: my_app.id}
        expect(response).to redirect_to registered_applications_path
      end
    end
  end

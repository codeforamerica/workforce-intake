require 'rails_helper'

RSpec.describe WorkforceApplicationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # WorkforceApplication. As you add validations to WorkforceApplication, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        email: "user@example.com",
        phone_number: "1234567890",
        household_size: "2",
        earned_income: "2000",
    }
  }

  let(:invalid_attributes) {
    {
        email: "",
        phone_number: "1234567890",
        household_size: "2",
        earned_income: "2000",
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorkforceApplicationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      WorkforceApplication.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      workforce_application = WorkforceApplication.create! valid_attributes
      get :show, params: {id: workforce_application.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      workforce_application = WorkforceApplication.create! valid_attributes
      get :edit, params: {id: workforce_application.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new WorkforceApplication" do
        expect {
          post :create, params: {workforce_application: valid_attributes}, session: valid_session
        }.to change(WorkforceApplication, :count).by(1)
      end

      it "redirects to the created workforce_application" do
        post :create, params: {workforce_application: valid_attributes}, session: valid_session
        expect(response).to redirect_to(WorkforceApplication.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {workforce_application: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
            email: "user@example.com",
            phone_number: "1234567890",
            household_size: "2",
            earned_income: "1000",
        }
      end

      it "updates the requested workforce_application" do
        workforce_application = WorkforceApplication.create! valid_attributes
        put :update, params: {id: workforce_application.to_param, workforce_application: new_attributes}, session: valid_session
        workforce_application.reload
        expect(workforce_application.earned_income).to eq 1000
      end

      it "redirects to the workforce_application" do
        workforce_application = WorkforceApplication.create! valid_attributes
        put :update, params: {id: workforce_application.to_param, workforce_application: valid_attributes}, session: valid_session
        expect(response).to redirect_to(workforce_application)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        workforce_application = WorkforceApplication.create! valid_attributes
        put :update, params: {id: workforce_application.to_param, workforce_application: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested workforce_application" do
      workforce_application = WorkforceApplication.create! valid_attributes
      expect {
        delete :destroy, params: {id: workforce_application.to_param}, session: valid_session
      }.to change(WorkforceApplication, :count).by(-1)
    end

    it "redirects to the workforce_applications list" do
      workforce_application = WorkforceApplication.create! valid_attributes
      delete :destroy, params: {id: workforce_application.to_param}, session: valid_session
      expect(response).to redirect_to(workforce_applications_url)
    end
  end

end

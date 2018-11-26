require "rails_helper"


RSpec.describe WorkforceApplication do
  describe "validation" do
    it "requires email" do
      app = WorkforceApplication.new

      expect(app).to be_invalid
      expect(app.errors).to include(:email)
    end
  end
end
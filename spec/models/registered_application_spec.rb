require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do

  let(:application) { create(:registered_application) }

  it { should belong_to(:user) }

  describe "attributes" do
    it "should respond to name" do
      expect(application).to respond_to(:name)
    end

    it "should respond to url" do
      expect(application).to respond_to(:url)
    end
  end


end

require 'rails_helper'

RSpec.describe "Admin Log In", type: :system do
  before do
    driven_by(:rack_test)
  end
  
    let(:admin) { create(:admin) }
    let(:requestor) { create(:requestor) }
    context "with valid credentials" do
    it "allows admin to sign in" do
      visit(new_user_session_path)
      fill_in "user_email", with: admin.email
      fill_in "user_password", with: admin.password
      within("form") { click_on("Log in") }

      expect(page).to have_current_path(admin_dashboard_index_path)
    end
  end

  context "with invalid credentials" do
    it "deny admin to sign in" do
      visit(new_user_session_path)
      fill_in "user_email", with: admin.email
      fill_in "user_password", with: requestor.password
      within("form") { click_on("Log in") }
      expect(page).to have_current_path(new_user_session_path)

    end
  end

end

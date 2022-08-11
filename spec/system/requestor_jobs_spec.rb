require 'rails_helper'

RSpec.describe "View all traders", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:admin) { create(:admin) }
  let(:requestor) { create(:requestor) }

  context "when user is an requestor" do
    it "can submit a job request" do
      sign_in requestor

      visit new_requestor_job_path
      expect(page).to have_css 'form'

      expect(page).to have_text('Nature of request')
      expect(page).to have_text('Note to staff')
      fill_in "job[nature_of_request]", with: 'painting of outside fence'
      fill_in "job[note_to_staff]", with: 'asap'
      
      expect {
        find('input[name="commit"]').click
        sleep(0.5)
      }.to change(Job, :count).by(1)
      expect(page).to have_text("Job Order was successfully created.")

    end
  end

#   sad

context "when user is an admin" do
    it "cant submit a job request" do
      sign_in admin
      expect{visit new_requestor_job_path}.to raise_error( ActionController::RoutingError)
    end
  end


end
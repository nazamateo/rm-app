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
      expect(page).to have_text("Queue")

    end
  end

    context "when user is a requestor" do
    it "can view all his job request" do
      sign_in requestor
      new_job = create(:newly_created, user: requestor)


      visit requestor_jobs_path
      expect(page).to have_css 'table'
      expect(page).to have_text(new_job.nature_of_request)
      expect(page).to have_xpath(".//tr", :count => requestor.jobs.count + 1)
      expect(page).not_to have_link(href: new_requestor_job_evaluation_path(new_job))
    end
  end

  context "when user is a requestor" do
    it "can give feedback when job order is done" do
      sign_in requestor
      done_job = create(:done, user: requestor)
      create(:remark_done_requestor, job: done_job)
      
      
      visit requestor_jobs_path
      expect(page).to have_css 'table'
      expect(page).to have_text("Done")
      expect(page).to have_link(href: new_requestor_job_evaluation_path(done_job))
      
      visit new_requestor_job_evaluation_path(done_job)
      expect(page).to have_css 'table'
      expect(page).to have_css 'form'
      choose('evaluation_response_time_5')
      choose('evaluation_response_time_5')
      choose('evaluation_response_time_5')
      fill_in "evaluation[comments]", with: 'Very good job! keep it up'
      click_on 'Create Evaluation'
      expect(page).to have_text("Thank you for your feedback! We are glad to be of service.")
    end
  end



#   sad
  context "when user is an admin" do
    it "cant submit a job request" do
        sign_in admin
        expect{visit new_requestor_job_path}.to raise_error( ActionController::RoutingError)
    end
  end

  context "when user is an admin" do
    it "cant give feedback when job order is done" do
      sign_in admin
      done_job = create(:done, user: requestor)
      create(:remark_done_requestor, job: done_job)
      
      expect{visit new_requestor_job_evaluation_path(done_job)}.to raise_error( ActionController::RoutingError)
    end
  end

end
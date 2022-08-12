require 'rails_helper'

RSpec.describe "View all traders", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:admin) { create(:admin) }
  let(:requestor) { create(:requestor) }

  let!(:newly_created) { create(:newly_created) }
  let!(:ongoing) { create(:ongoing) }
  let!(:done) { create(:done) }
  let!(:cancelled) { create(:cancelled) }

  let!(:engineer) { create(:engineer) }
  let!(:staff) { create(:staff) }

  let!(:remark_ongoing) { create(:remark_ongoing) }
  let!(:remark_cancelled) { create(:remark_cancelled) }
  let!(:remark_done) { create(:remark_done) }

  let!(:good) { create(:good) }

  context "when user is an admin" do
    it "shows all jobs" do
      sign_in admin

      visit admin_jobs_path
      expect(page).to have_css 'table'  
      expect(page).to have_text(newly_created.user.email)
      expect(page).to have_text(ongoing.user.service)
      expect(page).to have_text(done.user.unit)
      expect(page).to have_text(newly_created.nature_of_request)
      expect(page).to have_text(engineer.surname)
      expect(page).to have_text('Queue')
      expect(page).to have_text(newly_created.created_at.localtime.strftime("%b %d, '%y"))
      expect(page).to have_link(href: admin_job_path(newly_created))
      
    end
  end

    context "when user is an admin" do
    it "show a newly created job" do
      sign_in admin
      visit admin_jobs_path

      visit admin_job_path(newly_created)
      expect(page).to have_text('Assessed by')
      expect(page).to have_text('Assigned to')
      expect(page).to have_text('Maintenance group')
      expect(page).to have_text('6006')
      expect(page).to have_css 'table'
      
      expect(page).to have_text(newly_created.id)
      expect(page).to have_text(newly_created.nature_of_request)
      expect(page).to have_text(newly_created.note_to_staff)
      expect(page).to have_text('Queue')
      expect(page).to have_text(newly_created.created_at.localtime.strftime("%b %d, '%y"))
      expect(page).to have_link(href: edit_admin_job_path(newly_created))
      expect(page).to have_link(href: new_admin_job_remark_path(newly_created))
    end
  end

  context "when user is an admin" do
    it "can update job orders" do
      sign_in admin
      visit admin_jobs_path

      visit admin_job_path(newly_created)
      click_on('Assessed by:')
      expect(page).to have_text('Assessor')
      expect(page).to have_text('Assigned to')


      select( "Engr. #{engineer.surname}", from: 'job_assessor_id')
      select( "#{staff.surname}, #{staff.name[0,1]}", from: 'job_staff_id')

      within("form") { click_on("Update Job") }
      
      expect(current_path).to eql(admin_job_path(newly_created))
      expect(page).to have_text("Job Order# #{newly_created.id} was successfully updated!")
      
      expect(newly_created.reload.assessor_id).to eq engineer.id

    end
  end
  
  context "when user is an admin" do
    it "can add remarks to job orders" do
      sign_in admin
      visit admin_jobs_path
      
      visit admin_job_path(newly_created)
      click_on('Add Remarks')
      expect(current_path).to eql(new_admin_job_remark_path(newly_created))
      expect(page).to have_text('Status')
      expect(page).to have_text('Remarks')
      
      select('Ongoing', from: 'remark_status')
      fill_in "remark[remarks]", with: 'On going'
      find('input[name="commit"]').click
      expect(current_path).to eql(admin_job_path(newly_created))
      expect(page).to have_text("Job Order# #{newly_created.id} was successfully updated!")

      expect(newly_created.remark.last.reload.status).to eq 'Ongoing'
      expect(page).to have_text('On going')

    end
  end

  
  context "when user is an admin" do
    it "can add close job orders" do
      sign_in admin
      visit admin_jobs_path
      
      visit admin_job_path(newly_created)
      click_on('Add Remarks')
      expect(current_path).to eql(new_admin_job_remark_path(newly_created))
      select('Done', from: 'remark_status')
      fill_in "remark[remarks]", with: 'done'
      find('input[name="commit"]').click
      expect(current_path).to eql(admin_job_path(newly_created))
      expect(page).to have_text("Job Order# #{newly_created.id} was successfully closed!")

      expect(newly_created.remark.last.reload.status).to eq 'Done'

    end
  end

  #sad path

  context "when user is not an admin" do
    it "raise routing error" do
      sign_in requestor

      expect{visit admin_jobs_path}.to raise_error( ActionController::RoutingError)
    end
  end

  
  context "when user is a requestor" do
    it "cant update job orders" do
      sign_in requestor
      expect{visit admin_job_path(newly_created)}.to raise_error (ActionController::RoutingError)
    end
  end

  
  context "when user is a requestor" do
    it "cant add remarks to job orders" do
      sign_in requestor
      expect{visit new_admin_job_remark_path(newly_created)}.to raise_error (ActionController::RoutingError)
    end
  end

end
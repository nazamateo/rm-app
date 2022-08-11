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
    it "shows all requests" do
      sign_in admin

      visit admin_jobs_path
      expect(page).to have_css 'table'  
      expect(page).to have_text(newly_created.user.email)
      expect(page).to have_text(ongoing.user.service)
      expect(page).to have_text(done.user.unit)
      expect(page).to have_text(newly_created.nature_of_request)
      expect(page).to have_text(engineer.surname)
      expect(page).to have_text(remark_ongoing.status)
      expect(page).to have_text(remark_cancelled.remarks)
      expect(page).to have_text(newly_created.created_at.localtime.strftime("%b %d, '%y"))
      expect(page).to have_link(href: admin_job_path(newly_created))
    end
  end

  context "when user is not an admin" do
    it "raise routing error" do
      sign_in requestor

      expect{visit admin_jobs_path}.to raise_error( ActionController::RoutingError)
    end
  end

end
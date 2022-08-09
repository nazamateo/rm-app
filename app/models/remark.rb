class Remark < ApplicationRecord
    belongs_to :job
    validates :status, inclusion: { in: ['Cancelled','Pending', 'Ongoing', 'Done'] }

end

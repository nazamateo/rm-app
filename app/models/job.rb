class Job < ApplicationRecord
    validates :nature_of_request, length: { in: 10..50 }
    
    belongs_to :user
    belongs_to :assessor, class_name: 'Personnel', foreign_key: 'assessor', optional: true
    belongs_to :staff, class_name: 'Personnel', foreign_key: 'staff', optional: true
    has_one :evaluation
    has_many :remark
    
end
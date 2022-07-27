class Job < ApplicationRecord
    belongs_to :requestor, class_name: 'User', foreign_key: 'requestor', required: true
    belongs_to :assessor, class_name: 'Personnel', foreign_key: 'assessor', required: true
    belongs_to :staff, class_name: 'Personnel', foreign_key: 'staff', required: true
end

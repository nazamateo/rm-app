class Personnel < ApplicationRecord
    has_many :jobs, dependent: :destroy
end

class Evaluation < ApplicationRecord
    validates :response_time, :quality, :courtesy , numericality: { only_integer: true }
    validates :comments, length: { maximum: 100}
    belongs_to :job
end

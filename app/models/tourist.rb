class Tourist < ApplicationRecord
	belongs_to :trip

	validates :name, presence: true
end

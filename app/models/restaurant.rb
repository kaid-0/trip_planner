class Restaurant < ApplicationRecord
	belongs_to :trip

	validates :name, presence: true
end

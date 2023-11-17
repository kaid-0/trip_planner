class Trip < ApplicationRecord
	belongs_to :user

	has_many :hotels
	has_many :restaurants
	has_many :tourists

	def from_date_before_end_date
		if from_date > end_date
			errors.add(:from_date, "-> Starting Date has to occur before End Date of the trip")
		end
	end

	validates :user_id, presence: true
	validates :city, presence: true
	validates :from_date, presence: true
	validates :end_date, presence: true
	validates :head_count, presence: true, numericality: { only_integer: true }

	validate :from_date_before_end_date


end
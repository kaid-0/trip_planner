class Trip < ApplicationRecord
	belongs_to :user

	validates :user_id, presence: true
	validates :city, presence: true
	validates :from_date, presence: true
	validates :end_date, presence: true
	validates :head_count, presence: true, numericality: { only_integer: true }
end
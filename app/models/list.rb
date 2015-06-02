class List < ActiveRecord::Base
	has_many :todo, dependent: :delete_all
	belongs_to :user
	validates :title, :user_id , presence: true
	validates_length_of :title, in: 3..40
	validates_length_of :description, maximum: 140, allow_blank: true
end

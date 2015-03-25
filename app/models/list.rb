class List < ActiveRecord::Base
	has_many :todo, dependent: :delete_all
	validates_length_of :title, in: 3..40
	validates_length_of :title, maximum: 140, allow_blank: true
end

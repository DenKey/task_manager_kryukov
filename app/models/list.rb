class List < ActiveRecord::Base
	has_many :todo, dependent: :delete_all
end

class Todo < ActiveRecord::Base
  belongs_to :list
  validates_length_of :content, in: 0..140, message: "Too big Task"

  def done?
  	self.done.present?
  end

  def deadline?
  	self.deadline.present?
  end

end

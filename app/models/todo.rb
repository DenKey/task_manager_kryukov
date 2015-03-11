class Todo < ActiveRecord::Base
  belongs_to :list

  def done?
  	self.done.present?
  end

  def deadline?
  	self.deadline.present?
  end

end

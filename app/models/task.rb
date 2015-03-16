class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true

  after_create do
    self.done = false
  end
end

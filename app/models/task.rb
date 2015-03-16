class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true

  after_validation(on: :create) do
    self.done = false
  end

end

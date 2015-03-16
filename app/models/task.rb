class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true

  scope :done, -> {where(done: true)}
  scope :not_done, -> {where(done: false)}

  after_validation(on: :create) do
    self.done = false
  end

end

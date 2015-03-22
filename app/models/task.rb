class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true
  before_save(:downcase_description)

  private

  define_method(:downcase_description) do
    self.description=(description.downcase)
  end


end

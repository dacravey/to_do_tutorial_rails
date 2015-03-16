require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list}

  describe("#done") do
    it("will return done as false when initizialzed") do
      test_task = Task.create(description: "Clean up")
      expect(test_task.done).to(eq(false))
    end
  end

end

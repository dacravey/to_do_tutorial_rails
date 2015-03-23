require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list}


  it 'converts the name to lowercase' do
    task = FactoryGirl.create(:task, :description => "FINAGLE THE BUFFALO")
    task.description.should eq "finagle the buffalo"
  end

  describe("#done") do
    it("will return done as false when initialized") do
      test_task = FactoryGirl.create(:task, description: "Clean up")
      expect(test_task.done).to(eq(false))
    end

    it("will return false if task remains undone") do
      test_task = FactoryGirl.create(:task, description: "Clean up")
      test_task.done = false;
      expect(test_task.done).to(eq(false))
    end
  end
end

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
  end

  describe('.not_done') do
    it("will return all tasks where done is false") do
      test_task = FactoryGirl.create(:task, description: "Clean up")
      test_task.done = false;
      expect(test_task.not_done).to(eq([test_task]))
    end
  end
end

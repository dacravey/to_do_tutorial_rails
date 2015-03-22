require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list}



  it 'converts the name to lowercase' do
    task = Task.create(:description => "FINAGLE THE BUFFALO")
    task.description.should eq "finagle the buffalo"
  end
end

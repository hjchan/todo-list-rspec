require "rspec"

require_relative "task"
require_relative "list"

describe List do
  # Your specs here
  let(:title) { "Testing" }
  let(:tasks) { [Task.new("test 1"), Task.new("test 2")] }
  let(:list)  { List.new(title, tasks) }

  context "#initialize" do 
    it "takes title and tasks as arguments" do
      expect(list).to be_a_kind_of(List)
    end

    it "requires two arguments" do
      expect { List.new }.to raise_error(ArgumentError)
    end
  end

  context "#title" do
    it "returns the correct title for the list" do
      expect(list.title).to eq title
    end 
  end

  context "#add_task" do
    it "able to add task to the list" do
      temp_task = Task.new("test 3")
      list.add_task(temp_task)
      expect(list.tasks[2]).to eq temp_task
    end
  end

  context "#complete_task" do
    it "changes the task from incomplete to completed" do
      expect(list.tasks[0]).not_to be_complete
      list.complete_task(0)
      expect(list.tasks[0]).to be_complete
    end
  end

  context "#delete_task" do
    it "should delete the task from list" do
      list.delete_task(1)
      expect(list.tasks[1]).to eq nil
    end
  end

  context "#completed_task" do
    it "should successfully calculate the number of completed task" do
      expect(list.completed_tasks.count).to eq 0
      list.complete_task(0)
      expect(list.completed_tasks.count).to eq 1
    end
  end

  context "#incomplete_task" do
    it "should successfully calculate the number of incompleted task" do
      expect(list.incomplete_tasks.count).to eq 2
      list.complete_task(0)
      expect(list.incomplete_tasks.count).to eq 1
    end
  end
end
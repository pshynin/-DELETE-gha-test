# spec/task_manager_spec.rb
require_relative '../lib/task_manager'

describe TaskManager do
  let(:repository) { instance_double(TaskRepository) }
  let(:manager) { TaskManager.new(repository) }

  it 'adds a task through the repository' do
    task = instance_double(Task, title: 'Sample Task', due_date: Date.today, priority: 'High', category: 'Work')
    expect(repository).to receive(:add).with('Sample Task', Date.today, 'High', 'Work')
    manager.add_task(task.title, task.due_date, task.priority, task.category)
  end

  it 'views all tasks through the repository' do
    tasks = [instance_double(Task), instance_double(Task)]
    expect(repository).to receive(:all).and_return(tasks)
    expect { manager.view_tasks }.to output(/#{tasks[0]}/).to_stdout
  end

  it 'edits a task through the repository' do
    expect(repository).to receive(:update).with(1, 'New Title', Date.tomorrow, 'Low', 'Home')
    manager.edit_task(1, 'New Title', Date.tomorrow, 'Low', 'Home')
  end

  it 'deletes a task through the repository' do
    expect(repository).to receive(:delete).with(1)
    manager.delete_task(1)
  end
end

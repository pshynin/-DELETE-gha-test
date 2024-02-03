# spec/task_spec.rb
require_relative '../lib/task_manager'

describe Task do
  it 'creates a task with correct attributes' do
    task = Task.new('Sample Task', Date.today, 'High', 'Work')
    expect(task.title).to eq('Sample Task')
    expect(task.due_date).to eq(Date.today)
    expect(task.priority).to eq('High')
    expect(task.category).to eq('Work')
  end

  it 'converts task to string representation' do
    task = Task.new('Sample Task', Date.today, 'High', 'Work')
    expect(task.to_s).to eq('Sample Task (Due: ' + Date.today.to_s + ', Priority: High, Category: Work)')
  end
end

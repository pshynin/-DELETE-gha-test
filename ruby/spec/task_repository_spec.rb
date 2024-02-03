# spec/task_repository_spec.rb
require_relative '../lib/task_manager'

describe TaskRepository do
  let(:file_path) { 'test_tasks.txt' }
  let(:repository) { TaskRepository.new(file_path) }

  before do
    File.open(file_path, 'w') {} # Create an empty file before each test
  end

  after do
    File.delete(file_path) if File.exist?(file_path) # Remove the file after each test
  end

  it 'initializes a repository with correct attributes' do
    expect(repository.instance_variable_get(:@file_path)).to eq(file_path)
    expect(repository.instance_variable_get(:@tasks)).to be_empty
  end

  it 'adds a task to the repository' do
    task = Task.new('Sample Task', Date.today, 'High', 'Work')
    repository.add(task)
    expect(repository.all).to include(task)
  end

  it 'updates a task in the repository' do
    task = Task.new('Sample Task', Date.today, 'High', 'Work')
    repository.add(task)
    repository.update(1, 'Updated Task', Date.tomorrow, 'Low', 'Home')
    updated_task = repository.all.first
    expect(updated_task.title).to eq('Updated Task')
    expect(updated_task.due_date).to eq(Date.tomorrow)
    expect(updated_task.priority).to eq('Low')
    expect(updated_task.category).to eq('Home')
  end

  it 'deletes a task from the repository' do
    task = Task.new('Sample Task', Date.today, 'High', 'Work')
    repository.add(task)
    repository.delete(1)
    expect(repository.all).to be_empty
  end
end

require 'date'

require_relative 'task.rb'

require_relative 'task_repository.rb'

# Manages the business logic for tasks.
class TaskManagerSpec

  # Initializes a new TaskManagerSpec instance.
  def initialize(repository)
    @repository = repository
  end

  # Adds a new task.
  def add_task(title, due_date, priority, category)
    task = TaskSpec.new(title, due_date, priority, category)
    @repository.add(task)
    puts "TaskSpec added: #{task}"
  end

  # Displays all tasks.
  def view_tasks
    puts "\nAll Tasks:"
    @repository.all.each_with_index { |task, index| puts "#{index + 1}. #{task}" }
  end

  # Edits an existing task.
  def edit_task(index, new_title, new_due_date, new_priority, new_category)
    @repository.update(index, new_title, new_due_date, new_priority, new_category)
  end

  # Deletes a task.
  def delete_task(index)
    @repository.delete(index)
  end
end

require_relative 'task_ui.rb'

# Main program
repository = TaskRepositorySpec.new
manager = TaskManagerSpec.new(repository)
ui = TaskUI.new(manager)
ui.run

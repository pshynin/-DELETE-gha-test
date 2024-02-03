require 'date'

require_relative 'task.rb'

require_relative 'task_repository.rb'

class TaskManager
  def initialize(repository)
    @repository = repository
  end

  def add_task(title, due_date, priority, category)
    task = Task.new(title, due_date, priority, category)
    @repository.add(task)
    puts "Task added: #{task}"
  end

  def view_tasks
    puts "\nAll Tasks:"
    @repository.all.each_with_index { |task, index| puts "#{index + 1}. #{task}" }
  end

  def edit_task(index, new_title, new_due_date, new_priority, new_category)
    @repository.update(index, new_title, new_due_date, new_priority, new_category)
  end

  def delete_task(index)
    @repository.delete(index)
  end
end

require_relative 'task_ui.rb'

# Main program
repository = TaskRepository.new
manager = TaskManager.new(repository)
ui = TaskUI.new(manager)
ui.run

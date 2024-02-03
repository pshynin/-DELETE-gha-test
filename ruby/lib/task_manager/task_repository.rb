
# Manages the data access operations for tasks.
class TaskRepository
  def initialize(file_path = 'tasks.txt')
    @file_path = file_path
    @tasks = load_tasks
  end

  # Retrieves all tasks from the repository.
  def all
    @tasks
  end

  # Adds a new task to the repository.
  def add(task)
    @tasks << task
    save_tasks
  end

  # Updates an existing task in the repository.
  def update(index, new_title, new_due_date, new_priority, new_category)
    return puts 'Invalid task index.' if index < 1 || index > @tasks.length

    task = @tasks[index - 1]
    task.title = new_title if new_title
    task.due_date = new_due_date if new_due_date
    task.priority = new_priority if new_priority
    task.category = new_category if new_category

    save_tasks
    puts "Task updated: #{task}"
  end

  # Deletes a task from the repository.
  def delete(index)
    return puts 'Invalid task index.' if index < 1 || index > @tasks.length

    task = @tasks.delete_at(index - 1)
    save_tasks
    puts "Task deleted: #{task}"
  end

  private

  # Loads tasks from the file.
  def load_tasks
    return [] unless File.exist?(@file_path)

    File.readlines(@file_path).map do |line|
      title, due_date, priority, category = line.chomp.split('|')
      Task.new(title, Date.parse(due_date), priority, category)
    end
  end

  # Saves tasks to the file.
  def save_tasks
    File.open(@file_path, 'w') do |file|
      @tasks.each { |task| file.puts("#{task.title}|#{task.due_date}|#{task.priority}|#{task.category}") }
    end
  end
end
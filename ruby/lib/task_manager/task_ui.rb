class TaskUI
  def initialize(manager)
    @task_manager = manager
  end

  def run
    loop do
      puts "\nCommand Options:"
      puts "1. Add Task"
      puts "2. View Tasks"
      puts "3. Edit Task"
      puts "4. Delete Task"
      puts "5. Exit"

      print "Enter your choice: "
      choice = gets.chomp.to_i

      case choice
      when 1
        add_task
      when 2
        @task_manager.view_tasks
      when 3
        edit_task
      when 4
        delete_task
      when 5
        puts 'Exiting the Task Manager. Goodbye!'
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end

  private

  def add_task
    print 'Enter task title: '
    title = gets.chomp
    print 'Enter due date (YYYY-MM-DD): '
    due_date = Date.parse(gets.chomp)
    print 'Enter priority: '
    priority = gets.chomp
    print 'Enter category: '
    category = gets.chomp
    @task_manager.add_task(title, due_date, priority, category)
  end

  def edit_task
    print 'Enter the index of the task to edit: '
    index = gets.chomp.to_i
    print 'Enter new title (press enter to skip): '
    new_title = gets.chomp
    print 'Enter new due date (YYYY-MM-DD) (press enter to skip): '
    new_due_date = Date.parse(gets.chomp) rescue nil
    print 'Enter new priority (press enter to skip): '
    new_priority = gets.chomp
    print 'Enter new category (press enter to skip): '
    new_category = gets.chomp
    @task_manager.edit_task(index, new_title, new_due_date, new_priority, new_category)
  end

  def delete_task
    print 'Enter the index of the task to delete: '
    index = gets.chomp.to_i
    @task_manager.delete_task(index)
  end
end
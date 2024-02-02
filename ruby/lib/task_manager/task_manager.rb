# frozen_string_literal: true

require 'date'

class Task
  attr_accessor :title, :due_date, :priority, :category

  def initialize(title, due_date, priority, category)
    @title = title
    @due_date = due_date
    @priority = priority
    @category = category
  end

  def to_s
    "#{@title} (Due: #{@due_date}, Priority: #{@priority}, Category: #{@category})"
  end
end

class TaskManager
  def initialize
    @tasks = []
  end

  def add_task(title, due_date, priority, category)
    task = Task.new(title, due_date, priority, category)
    @tasks << task
    save_tasks_to_file
    puts "Task added: #{task}"
  end

  def view_tasks
    puts "\nAll Tasks:"
    @tasks.each_with_index { |task, index| puts "#{index + 1}. #{task}" }
  end

  def edit_task(index, new_title, new_due_date, new_priority, new_category)
    return puts 'Invalid task index.' if index < 1 || index > @tasks.length

    task = @tasks[index - 1]
    task.title = new_title if new_title
    task.due_date = new_due_date if new_due_date
    task.priority = new_priority if new_priority
    task.category = new_category if new_category

    save_tasks_to_file
    puts "Task updated: #{task}"
  end

  def delete_task(index)
    return puts 'Invalid task index.' if index < 1 || index > @tasks.length

    task = @tasks.delete_at(index - 1)
    save_tasks_to_file
    puts "Task deleted: #{task}"
  end

  private

  def save_tasks_to_file
    File.open('tasks.txt', 'w') do |file|
      @tasks.each { |task| file.puts("#{task.title}|#{task.due_date}|#{task.priority}|#{task.category}") }
    end
  end

  def load_tasks_from_file
    return unless File.exist?('tasks.txt')

    File.readlines('tasks.txt').each do |line|
      title, due_date, priority, category = line.chomp.split('|')
      @tasks << Task.new(title, due_date, priority, category)
    end
  end
end

# Main program
task_manager = TaskManager.new
task_manager.load_tasks_from_file

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
    print 'Enter task title: '
    title = gets.chomp
    print 'Enter due date (YYYY-MM-DD): '
    due_date = Date.parse(gets.chomp)
    print 'Enter priority: '
    priority = gets.chomp
    print 'Enter category: '
    category = gets.chomp
    task_manager.add_task(title, due_date, priority, category)
  when 2
    task_manager.view_tasks
  when 3
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
    task_manager.edit_task(index, new_title, new_due_date, new_priority, new_category)
  when 4
    print 'Enter the index of the task to delete: '
    index = gets.chomp.to_i
    task_manager.delete_task(index)
  when 5
    puts 'Exiting the Task Manager. Goodbye!'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end


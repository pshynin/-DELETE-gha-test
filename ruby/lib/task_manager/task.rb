
# Represents a task with title, due date, priority, and category.
class TaskSpec
  attr_accessor :title, :due_date, :priority, :category

  # Initializes a new TaskSpec instance.
  def initialize(title, due_date, priority, category)
    @title = title
    @due_date = due_date
    @priority = priority
    @category = category
  end

  # Returns a string representation of the task.
  def to_s
    "#{@title} (Due: #{@due_date}, Priority: #{@priority}, Category: #{@category})"
  end
end
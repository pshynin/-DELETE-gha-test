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
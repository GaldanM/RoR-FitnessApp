module CoursesHelper
  def days
    options_for_select([['Monday', 1], ['Tuesday', 2], ['Wednesday', 3],
                        ['Thursday', 4], ['Friday', 5], ['Saturday', 6],
                        ['Sunday', 7]])
  end

  def days_edit(value)
    options_for_select([['Monday', 1], ['Tuesday', 2], ['Wednesday', 3],
                        ['Thursday', 4], ['Friday', 5], ['Saturday', 6],
                        ['Sunday', 7]], value)
  end

  def hours
    options_for_select(Array.new(24) { |index| Array.new(2) { index } })
  end

  def hours_edit(value)
    options_for_select(Array.new(24) { |index| Array.new(2) { index } }, value)
  end

  def minutes
    options_for_select([['00', 0], ['15', 15], ['30', 30], ['45', 45]])
  end

  def minutes_edit(value)
    options_for_select([['00', 0], ['15', 15], ['30', 30], ['45', 45]], value)
  end

  def get_day_from_index(index)
    arr = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
    arr[index]
  end

  def get_day_from_name(name)
    arr = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
    arr.index(name)
  end

  def get_hours_from_time(time)
    Integer(time.split(':')[0].strip)
  end

  def get_minutes_from_time(time)
    Integer(time.split(':')[1].strip)
  end
end

module ApplicationHelper
  def humanize(secs)
    [[60, :seconds], [60, :minutes], [24, :hours], [1000, :days]].map{ |count, name|
      if secs > 0
        secs, n = secs.divmod(count)
        "#{n.to_i} #{name}"
      end
    }.compact.reverse.first
  end

  def trim(num)
    i, f = num.to_i, num.to_f
    i == f ? i : f
  end
end

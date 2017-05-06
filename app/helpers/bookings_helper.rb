module BookingsHelper
  def get_dates(params)
    dates = []
    dates.push(DateTime.parse(params[:formBooking][:start_date]))
    if params[:formBooking][:type] == 'true'
      (0..4).each { |i|
        dates.push(dates[i] + 7)
      }
    end
    dates
  end

  def get_next_day_of_week(day_of_week)
    day_of_week > Date.today.cwday ? Date.today.beginning_of_week + day_of_week - 1 : Date.today.next_week + day_of_week - 1
  end
end

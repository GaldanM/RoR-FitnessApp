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
end

class BookingsController < ApplicationController

  # GET /courses/:id/bookings/new

  def new
    @course = Course.find(params[:course_id])
  end

  # GET /courses/:id/bookings/:id/edit

  def edit
    @course = Course.find(params[:course_id])
    @booking = @course.bookings.find(params[:id])
  end

  # POST /courses/:id/bookings

  def create
    @course = Course.find(params[:course_id])
    if !params[:formBooking][:membership].empty? && params[:formBooking][:type] == 'false' && @course.bookings.select { |b| b.membership == params[:formBooking][:membership] && b.date == DateTime.parse(params[:formBooking][:start_date]) }.any?
      flash[:danger] = 'You are already registered to the \"' + @course.title + '\" class'
    else
      dates = get_dates(params)
      dates.each do |d|
        next if @course.bookings.select { |b| b.membership == params[:formBooking][:membership] && b.date == d }.any?
        booking = Booking.create(name: params[:formBooking][:name],
                                 phone: params[:formBooking][:phone],
                                 email: params[:formBooking][:email],
                                 date: d,
                                 membership: params[:formBooking][:membership])
        @course.bookings << booking
      end
      flash[:success] = 'You successfully subscribed to the \"' + @course.title + '\" class'
    end
    redirect_to courses_path
  end

  # POST /courses/:id/bookings/:id/

  def update
    return unless current_admin
    @course = Course.find(params[:course_id])
    @booking = @course.bookings.find(params[:id])
    if !params[:formBooking][:membership].empty? && params[:formBooking][:type] == 'false' && @course.bookings.select { |b| b.membership == params[:formBooking][:membership] && b.date == DateTime.parse(params[:formBooking][:start_date]) }.any?
      flash.now[:danger] = 'You are already registered to the \"' + @course.title + '\" class at this date'
      render 'edit'
    else
      if @booking.update(name: params[:formBooking][:name],
                         phone: params[:formBooking][:phone],
                         email: params[:formBooking][:email],
                         date: params[:formBooking][:start_date],
                         membership: params[:formBooking][:membership])
        flash[:success] = 'Booking successfully updated'
        redirect_to courses_path
      else
        flash.now[:danger] = 'Membership could not be updated'
        render 'edit'
      end
    end
  end

  # DELETE /courses/:id/bookings/:id

  def destroy
    return unless current_admin
    course = Course.find(params[:course_id])
    booking = course.bookings.find(params[:id])
    name = booking.name
    booking.destroy
    if booking.destroyed?
      flash[:success] = '\"' + name + '\" successfully unsuscribed from \"' + course.title + '\"'
    else
      flash[:danger] = 'Could not unsuscribe \"' + name + '\" from \"' + course.title + '\"'
    end
    redirect_to courses_path
  end

end

class BookingsController < ApplicationController

  # GET /courses/:id/bookings/new

  def new
    current_admin && redirect_to(courses_path)
    @course = Course.find(params[:course_id])
  end

  # POST /courses/:id/bookings

  def create
    return if current_admin
    @course = Course.find(params[:course_id])
    if !params[:formBooking][:membership].empty? && @course.bookings.include?(Booking.find_by_membership(params[:formBooking][:membership]))
      flash[:danger] = 'You are already registered to the \"' + @course.title + '\" class'
      redirect_to courses_path
    else
      booking = Booking.create(name: params[:formBooking][:name],
                               phone: params[:formBooking][:phone],
                               email: params[:formBooking][:email],
                               membership: params[:formBooking][:membership])
      if booking.valid?
        @course.bookings << booking
        flash[:success] = 'You successfully subscribed to the \"' + @course.title + '\" class'
        redirect_to courses_path
      else
        flash.now[:danger] = 'Your subscription to this class failed'
        render 'new'
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

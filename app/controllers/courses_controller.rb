class CoursesController < ApplicationController

  # GET /courses

  def index
  end

  # GET /courses/new

  def new
    !current_admin && redirect_to(courses_path)
  end

  # GET /courses/:id/edit

  def edit
    !current_admin && redirect_to(courses_path)
    @course = Course.find(params[:id])
  end

  # POST /courses

  def create
    return unless current_admin
    course = Course.create(title: params[:formCourse][:title], description: params[:formCourse][:description], price: Float(params[:formCourse][:price]))
    if course.valid?
      flash[:success] = 'Course \"' + params[:formCourse][:title] + '\" successfully created'
      redirect_to courses_path
    else
      flash.now[:danger] = 'Course \"' + params[:formCourse][:title] + '\" could not be created'
      render 'new'
    end
  end

  # PATCH /courses/:id

  def update
    return unless current_admin
    @course = Course.find(params[:id])
    if @course.update(title: params[:formCourse][:title], description: params[:formCourse][:description], price: Float(params[:formCourse][:price]))
      flash[:success] = 'Course \"' + @course.title + '\" successfully updated'
      redirect_to courses_path
    else
      flash.now[:danger] = 'Course \"' + @course.title + '\" could not be updated'
      render 'edit'
    end
  end

  # DELETE /courses/:id

  def destroy
    return unless current_admin
    course = Course.find(params[:id])
    title = course.title
    course.destroy
    if course.destroyed?
      flash[:success] = 'Course \"' + title + '\" successfully deleted'
    else
      flash[:danger] = 'Course \"' + title + '\" could not be deleted'
    end
    redirect_to courses_path
  end

end

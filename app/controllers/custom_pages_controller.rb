class CustomPagesController < ApplicationController

# GET /memberships/new

  def show
    @custom_page = CustomPage.find(params[:id])
    !@custom_page.editable && redirect_to(root_path)
  end

  # GET /custom_pages/new

  def new
    !current_admin && redirect_to(courses_path)
  end

  # GET /custom_pages/:id/edit

  def edit
    !current_admin && redirect_to(custom_pages_path)
    @custom_page = CustomPage.find(params[:id])
    !@custom_page.editable && redirect_to(root_path)
  end

  # POST /custom_pages

  def create
    return unless current_admin

    custom_page = CustomPage.create(title: params[:formCustomPage][:title], text: params[:formCustomPage][:text])

    if custom_page.valid?
      flash[:success] = 'Your custom page has been successfully created'
      redirect_to root_path
    else
      flash.now[:danger] = 'Your custom page could not be created'
      render 'new'
    end
  end

  # PATCH /custom_pages/:id

  def update
    return unless current_admin

    @custom_page = CustomPage.find(params[:id])
    !@custom_page.editable && redirect_to(root_path)

    if @custom_page.update(title: params[:formCustomPage][:title], text: params[:formCustomPage][:text])
      flash[:success] = 'Your static page has been updated'
      redirect_to root_path
    else
      flash.now[:danger] = 'Your static page cannot be updated'
      render 'edit'
    end
  end

  # DELETE /custom_pages/:id
  def destroy
    return unless current_admin

    custom_page = CustomPage.find(params[:id])
    !custom_page.editable && redirect_to(root_path)

    title = custom_page.title
    text = custom_page.text
    custom_page.destroy

    if custom_page.destroyed?
      flash[:success] = 'Course \"' + title + '\" successfully deleted'
    else
      flash[:danger] = 'Course \"' + title + '\" could not be deleted'
    end
    redirect_to courses_path

  end

end

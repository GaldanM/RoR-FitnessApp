class CustomPagesController < ApplicationController

# GET /memberships/new

    def show
    end
    
    # GET /custom_pages/new

    def new
        !current_admin && redirect_to(courses_path)
    end
    
    # GET /custom_pages/:id/edit
    
    def edit
        !current_admin && redirect_to(custom_pages_path)
        @custom_page = Custom_page.find(params[:id])
    end
    
    # POST /custom_pages

    def create
        return if current_admin
    
        custom_page = Custom_page.create(title: params[:formCP][:title], text: params[:formCP][:text])
    
        if custom_page.valid?
            flash[:success] = 'Your static page has been created succefully'
            redirect_to root_path
        else
            flash.now[:danger] = 'Your static page cannot be create'
            render 'new'
        end
    end
    
     # PATCH /custom_pages/:id
    
    def update
        return if current_admin
    
        @custom_page = Custom_page.find(params[:id])
    
        if @custom_page.update(title: params[:formCP][:title], text: params[:formCP][:text])
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
        
        custom_page = Custom_page.find(params[:id])
        
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

class GalleryController < ApplicationController
  def index
    @custom_page = CustomPage.find(params[:custom_page_id])
  end

  def update
    @custom_page = CustomPage.find(params[:custom_page_id])
    array = params[:formCustomgallery][:pictures].drop(1)
    pics = Picture.find(array)
    @custom_page.pictures.delete_all
    if pics.each { |p| @custom_page.pictures << p }
      flash.now[:success] = 'Gallery of ' + @custom_page.title + ' successfully updated'
    else
      flash.now[:danger] = 'There was a problem while updating ' + @custom_page.title + "'s gallery"
    end
    render 'index'
  end
end

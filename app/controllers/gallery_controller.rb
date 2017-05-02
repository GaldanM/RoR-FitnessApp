class GalleryController < ApplicationController
  def index
    @page = CustomPage.find(params[:custom_page_id])
  end

  def create

  end

  def destroy

  end
end

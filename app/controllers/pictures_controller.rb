class PicturesController < ApplicationController

  # GET /images

  def index
  end

  # POST /images

  def create
    original_file = params[:formPicture][:image]
    file_name = original_file.original_filename
    img = Picture.create(filename: file_name, alt_text: file_name, caption: params[:formPicture][:caption])
    if img.valid?
      CustomPage.find(5).pictures << img
      directory = 'public/uploads'
      Dir.mkdir(directory) unless File.exist?(directory)
      path = File.join(directory, file_name)
      File.open(path, 'wb') { |t| t.write(original_file.read) }
      flash.now[:success] = '\"' + file_name + '\" was successfully uploaded'
    else
      flash.now[:danger] = 'There was an error while uploading \"' + file_name + '\"'
    end
    render 'index'
  end

  # DELETE /images/:id

  def destroy
    array = params[:formDeletePictures][:pictures].drop(1)
    pics = Picture.find(array)
    if pics.each(&:destroy)
      flash.now[:success] = 'Pictures successfully deleted'
    else
      flash.now[:danger] = 'There was a problem while deleting these pictures'
    end
    render 'index'
  end
end

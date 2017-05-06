class MessagesController < ApplicationController

  # GET /contact

  def new
    current_admin && redirect_to(messages_path)
    @contact_us = CustomPage.find_by(title: 'Contact us')
  end

  # GET /messages

  def index
    !current_admin && redirect_to(contact_path)
  end

  # GET /messages/:id

  def show
    !current_admin && redirect_to(contact_path)
    @message = Message.find(params[:id])
  end

  # POST /messages

  def create
    return if current_admin
    message = Message.create(name: params[:formMessage][:name], phone: params[:formMessage][:phone], email: params[:formMessage][:email], text: params[:formMessage][:text], date: DateTime.now)
    if message.valid?
      flash[:success] = 'Your message has been sent successfully'
      redirect_to root_path
    else
      flash.now[:danger] = 'Your message could not be send'
      @contact_us = CustomPage.find_by(title: 'Contact us')
      render 'new'
    end
  end

  # DELETE /messages/:id

  def destroy
    return unless current_admin
    message = Message.find(params[:id])
    message.destroy
    if message.destroyed?
      flash[:success] = 'Message deleted successfully !'
    else
      flash[:danger] = 'Message could not be deleted !'
    end
    redirect_to messages_path
  end

end

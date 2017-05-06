class MembershipsController < ApplicationController

  # GET /memberships

  def index
    @memberships = CustomPage.find_by(title: 'Memberships')
  end

  # GET /memberships/new

  def new
    !current_admin && redirect_to(memberships_path)
  end

  # GET /memberships/:id/edit

  def edit
    !current_admin && redirect_to(memberships_path)
    @membership = Membership.find(params[:id])
  end

  # POST /memberships

  def create
    return unless current_admin
    membership = Membership.create(title: params[:formMembership][:title], description: params[:formMembership][:description], price: Float(params[:formMembership][:price]))
    if membership.valid?
      flash[:success] = 'Membership \"' + params[:formMembership][:title] + '\" successfully created'
      redirect_to memberships_path
    else
      flash.now[:danger] = 'Membership \"' + params[:formMembership][:title] + '\" could not be created'
      render 'new'
    end
  end

  # PATCH /memberships/:id

  def update
    return unless current_admin
    @membership = Membership.find(params[:id])
    if @membership.update(title: params[:formMembership][:title], description: params[:formMembership][:description], price: Float(params[:formMembership][:price]))
      flash[:success] = 'Membership \"' + @membership.title + '\" successfully updated'
      redirect_to memberships_path
    else
      flash.now[:danger] = 'Membership \"' + @membership.title + '\" could not be updated'
      render 'edit'
    end
  end

  # DELETE /memberships/:id

  def destroy
    return unless current_admin
    membership = Membership.find(params[:id])
    title = membership.title
    membership.destroy
    if membership.destroyed?
      flash[:success] = 'Membership \"' + title + '\" successfully deleted'
    else
      flash[:danger] = 'Membership \"' + title + '\" could not be deleted'
    end
    redirect_to memberships_path
  end

end

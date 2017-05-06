class StaticPagesController < ApplicationController
  def home
    @home = CustomPage.find_by(title: 'Homepage')
  end
end

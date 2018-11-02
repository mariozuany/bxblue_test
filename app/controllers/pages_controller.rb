class PagesController < ApplicationController
  def about
    @title = 'About us'
    @content = 'This is a about page.'
  end

  def terms
    @title = 'Terms'
    @content = 'This is a about page.'
  end

end

class PagesController < ApplicationController
  
  def home
    @page_title = 'zoolah_example'
  end
  
  def css_test
    @page_title = "CSS Test"
  end
  
end

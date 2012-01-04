class HomeController < ApplicationController
  
   def index_app
    @appsofts = Appsoft.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appsofts }
    end
  end
  
  def detail
     @appsoft = Appsoft.find(params[:id])
     render "detail.html.erb"
  end

end
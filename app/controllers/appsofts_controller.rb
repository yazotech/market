class AppsoftsController < ApplicationController
  # GET /appsofts
  # GET /appsofts.xml
  def index
    @appsofts = Appsoft.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appsofts }
    end
  end

  # GET /appsofts/1
  # GET /appsofts/1.xml
  def show
    @appsoft = Appsoft.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appsoft }
    end
  end

  # GET /appsofts/new
  # GET /appsofts/new.xml
  def new
    @appsoft = Appsoft.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appsoft }
    end
  end

  # GET /appsofts/1/edit
  def edit
    @appsoft = Appsoft.find(params[:id])
  end

  # POST /appsofts
  # POST /appsofts.xml
  def create
    @appsoft = Appsoft.new(params[:appsoft])
    
    if params[:icon_path]
      name = params[:icon_path].original_filename
      #ext = File.basename(ipath).split('.')[0]
      directory = "public/upload/"
      path = File.join(directory,name)
      File.open(path, "wb") { |f| f.write(params[:icon_path].read) }
      #@appsoft.icon_path = name
    end
    
    if params[:apk_path]
      name = params[:apk_path].original_filename
      directory = "public/upload/"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:apk_path].read )}
      
      @appsoft.apk_path = name
    end
 
    respond_to do |format|
      if @appsoft.save
        format.html { redirect_to(@appsoft, :notice => 'Appsoft was successfully created.') }
        format.xml  { render :xml => @appsoft, :status => :created, :location => @appsoft }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appsoft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appsofts/1
  # PUT /appsofts/1.xml
  def update
    @appsoft = Appsoft.find(params[:id])
    
    if params[:apk_path]
      name = params[:apk_path].original_filename
      directory = "public/upload/"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:apk_path].read )}
      
      @appsoft.apk_path = name
    end

    if params[:icon_path]
      img = Appimg.new
      name = params[:icon_path].original_filename
      img.imgname = name
      img.app_id = params[:id]
      #img.icon_path = params[:id] + '_' + 
      img.save
      #ext = File.basename(ipath).split('.')[0]
      directory = "public/upload/"
      na = params[:id] + '_' + img.id.to_s + File.extname(params[:icon_path].original_filename)
      path = File.join(directory,na)
      File.open(path, "wb") { |f| f.write(params[:icon_path].read) }
      #@appsoft.icon_path = name
    end

    respond_to do |format|
      if @appsoft.update_attributes(params[:appsoft])
        format.html { redirect_to(@appsoft, :notice => 'Appsoft was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appsoft.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appsofts/1
  # DELETE /appsofts/1.xml
  def destroy
    @appsoft = Appsoft.find(params[:id])
    @appsoft.destroy

    respond_to do |format|
      format.html { redirect_to(appsofts_url) }
      format.xml  { head :ok }
    end
  end
end

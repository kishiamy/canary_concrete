class PagesController < ApplicationController
  before_filter :is_admin, :except => :show
  layout 'admin', :except => :show

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.tree

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end


  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    if params[:page_id]
      @page.page_id = Page.find(params[:page_id])
    end
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    params[:page].delete(:page_id)
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def move
    @page = Page.find(params[:id])
  end

  def update_location
    @page = Page.find(params[:id])
    if params[:page].blank? or params[:page][:page_id] == 'nav-bar'
     @page.page_id = nil 
    else
      @page.page_id = params[:page][:page_id].to_i
    end

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path, notice: 'Page was successfully moved.' }
        format.json { head :no_content }
      else
        format.html { render action: "move" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end

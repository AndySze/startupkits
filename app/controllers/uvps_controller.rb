class UvpsController < ApplicationController
  before_filter :get_idea
  # GET /uvps
  # GET /uvps.json
  def index
    @uvps = @idea.uvps.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uvps }
    end
  end

  # GET /uvps/1
  # GET /uvps/1.json
  def show
    @uvp = Uvp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @uvp }
    end
  end

  # GET /uvps/new
  # GET /uvps/new.json
  def new
    @uvp = Uvp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @uvp }
    end
  end

  # GET /uvps/1/edit
  def edit
    @uvp = Uvp.find(params[:id])
  end

  # POST /uvps
  # POST /uvps.json
  def create
    @uvp = @idea.uvps.new(params[:uvp])

    respond_to do |format|
      if @uvp.save
        format.html { redirect_to [current_user,@idea,@uvp], notice: 'Uvp was successfully created.' }
        format.json { render json: @uvp, status: :created, location: @uvp }
      else
        format.html { render action: "new" }
        format.json { render json: @uvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uvps/1
  # PUT /uvps/1.json
  def update
    @uvp = @idea.uvps.find(params[:id])

    respond_to do |format|
      if @uvp.update_attributes(params[:uvp])
        format.html { redirect_to [current_user,@idea,@uvp], notice: 'Uvp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @uvp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uvps/1
  # DELETE /uvps/1.json
  def destroy
    @uvp = Uvp.find(params[:id])
    @uvp.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end

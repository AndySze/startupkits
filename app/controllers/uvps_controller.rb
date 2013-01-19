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
    @uvp = @idea.uvps.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @uvp }
    end
  end

  # GET /uvps/new
  # GET /uvps/new.json
  def new
    @uvp = @idea.uvps.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @uvp }
    end
  end

  # GET /uvps/1/edit
  def edit
    @uvp = @idea.uvps.find(params[:id])
  end

  # POST /uvps
  # POST /uvps.json
  def create
    @uvp = @idea.uvps.new(title: params[:toSent]) #@idea.uvps.new(params[:uvp])

    if @uvp.save
      render json: { text: "success", id: "#{@uvp.id}" }
    else
      render json: { text: "fail"}
    end
  end

  # PUT /uvps/1
  # PUT /uvps/1.json
  def update
    @uvp = @idea.uvps.find(params[:id])

    if @uvp.update_attributes(params[:uvp])
      render json: { text: "success"}
    else
      render json: { text: "fail"}
    end
  end

  # DELETE /uvps/1
  # DELETE /uvps/1.json
  def destroy
    @uvp = Uvp.find(params[:id])
    @uvp.destroy

    render json: { text: "success"}
  end
end

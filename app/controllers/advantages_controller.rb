class AdvantagesController < ApplicationController
  before_filter :get_idea
  # GET /advantages
  # GET /advantages.json
  def index
    @advantages = @idea.advantages.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @advantages }
    end
  end

  # GET /advantages/1
  # GET /advantages/1.json
  def show
    @advantage = @idea.advantages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @advantage }
    end
  end

  # GET /advantages/new
  # GET /advantages/new.json
  def new
    @advantage = @idea.advantages.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @advantage }
    end
  end

  # GET /advantages/1/edit
  def edit
    @advantage = @idea.advantages.find(params[:id])
  end

  # POST /advantages
  # POST /advantages.json
  def create
    @advantage = @idea.advantages.new(title: params[:toSent]) #@idea.advantages.new(params[:advantage])

    if @advantage.save
      render json: { text: "success", id: "#{@advantage.id}"}
    else
      render json: { text: "fail" }
    end
  end

  # PUT /advantages/1
  # PUT /advantages/1.json
  def update
    @advantage = @idea.advantages.find(params[:id])

    if @advantage.update_attributes(params[:advantage])
      render json: { text: "success" }
    else
      render json: { text: "fail"}
    end
  end

  # DELETE /advantages/1
  # DELETE /advantages/1.json
  def destroy
    @advantage = @idea.advantages.find(params[:id])
    @advantage.destroy

    render json: { text: "success" }
  end
end

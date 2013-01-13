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
    @advantage = Advantage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @advantage }
    end
  end

  # GET /advantages/new
  # GET /advantages/new.json
  def new
    @advantage = Advantage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @advantage }
    end
  end

  # GET /advantages/1/edit
  def edit
    @advantage = Advantage.find(params[:id])
  end

  # POST /advantages
  # POST /advantages.json
  def create
    @advantage = @idea.advantages.new(params[:advantage])

    respond_to do |format|
      if @advantage.save
        format.html { redirect_to [current_user,@idea,@advantage], notice: 'Advantage was successfully created.' }
        format.json { render json: @advantage, status: :created, location: @advantage }
      else
        format.html { render action: "new" }
        format.json { render json: @advantage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /advantages/1
  # PUT /advantages/1.json
  def update
    @advantage = @idea.advantages.find(params[:id])

    respond_to do |format|
      if @advantage.update_attributes(params[:advantage])
        format.html { redirect_to [current_user,@idea,@advantage], notice: 'Advantage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @advantage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advantages/1
  # DELETE /advantages/1.json
  def destroy
    @advantage = Advantage.find(params[:id])
    @advantage.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end

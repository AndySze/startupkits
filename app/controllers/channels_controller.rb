class ChannelsController < ApplicationController
  before_filter :get_idea
  # GET /channels
  # GET /channels.json
  def index
    @channels = @idea.channels.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @channels }
    end
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @channel = @idea.channels.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/new
  # GET /channels/new.json
  def new
    @channel = @idea.channels.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/1/edit
  def edit
    @channel = @idea.channels.find(params[:id])
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = @idea.channels.new(title: params[:toSent]) #@idea.channels.new(params[:channel])

    if @channel.save
      render json: { text: "success", id: "#{@channel.id}"}
    else
      render json: {text: "fail"}
    end
  end

  # PUT /channels/1
  # PUT /channels/1.json
  def update
    @channel = @idea.channels.find(params[:id])

    if @channel.update_attributes(params[:channel])
      render json: { text: "success" }
    else
      render json: { text: "fail" }
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel = @idea.channels.find(params[:id])
    @channel.destroy

    render json: { text: "success" }
  end
end

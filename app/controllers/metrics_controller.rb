class MetricsController < ApplicationController
  before_filter :get_idea
  # GET /metrics
  # GET /metrics.json
  def index
    @metrics = @idea.metrics.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @metrics }
    end
  end

  # GET /metrics/1
  # GET /metrics/1.json
  def show
    @metric = @idea.metrics.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @metric }
    end
  end

  # GET /metrics/new
  # GET /metrics/new.json
  def new
    @metric = @idea.metrics.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @metric }
    end
  end

  # GET /metrics/1/edit
  def edit
    @metric = @idea.metrics.find(params[:id])
  end

  # POST /metrics
  # POST /metrics.json
  def create
    @metric = @idea.metrics.new(title: params[:toSent]) #@idea.metrics.new(params[:metric])

    if @metric.save
      render json: { text: "success", id: "#{@metric.id}" }
    else
      render json: { text: "fail"}
    end
  end

  # PUT /metrics/1
  # PUT /metrics/1.json
  def update
    @metric = @idea.metrics.find(params[:id])

    if @metric.update_attributes(params[:metric])
      render json: { text: "success"}
    else
      render json: { text: "fail"}
    end
  end

  # DELETE /metrics/1
  # DELETE /metrics/1.json
  def destroy
    @metric = Metric.find(params[:id])
    @metric.destroy

    render json: { text: "success"}
  end
end

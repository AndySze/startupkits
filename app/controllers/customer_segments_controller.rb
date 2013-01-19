class CustomerSegmentsController < ApplicationController

  before_filter :get_idea
  # GET /customer_segments
  # GET /customer_segments.json
  def index
    @customer_segments = @idea.customer_segments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_segments }
    end
  end

  # GET /customer_segments/1
  # GET /customer_segments/1.json
  def show
    @customer_segment = @idea.customer_segments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_segment }
    end
  end

  # GET /customer_segments/new
  # GET /customer_segments/new.json
  def new
    @customer_segment = @idea.customer_segments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_segment }
    end
  end

  # GET /customer_segments/1/edit
  def edit
    @customer_segment = @idea.customer_segments.find(params[:id])
  end

  # POST /customer_segments
  # POST /customer_segments.json
  def create
    @customer_segment = @idea.customer_segments.new(title: params[:toSent]) # @idea.customer_segments.new(params[:customer_segment]) #change to ajax

    if @customer_segment.save
      #format.html { redirect_to [current_user,@idea,@customer_segment], notice: 'Customer segment was successfully created.' }
      render :json => {text: 'success',id: "#{@customer_segment.id}" }
    else
      #format.html { render action: "new" }
      render :json => {text: 'fail' }
    end
  end

  # PUT /customer_segments/1
  # PUT /customer_segments/1.json
  def update
    @customer_segment = CustomerSegment.find(params[:id])

    if @customer_segment.update_attributes(params[:customer_segment])
      render json: { text: "success" }
    else
      render json: { text: "fail"}
    end
  end

  # DELETE /customer_segments/1
  # DELETE /customer_segments/1.json
  def destroy
    @customer_segment = @idea.customer_segments.find(params[:id])
    @customer_segment.destroy

    render json: { text: "success" }
  end

end

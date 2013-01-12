class CustomerSegmentsController < ApplicationController

  before_filter :get_idea
  # GET /customer_segments
  # GET /customer_segments.json
  def index
    @customer_segments = @idea.customer_segments.limit(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_segments }
    end
  end

  # GET /customer_segments/1
  # GET /customer_segments/1.json
  def show
    @customer_segment = CustomerSegment.find(params[:id])

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
    @customer_segment = CustomerSegment.find(params[:id])
  end

  # POST /customer_segments
  # POST /customer_segments.json
  def create
    @customer_segment = @idea.customer_segments.new(params[:customer_segment])

    respond_to do |format|
      if @customer_segment.save
        format.html { redirect_to [current_user,@idea,@customer_segment], notice: 'Customer segment was successfully created.' }
        format.json { render json: @customer_segment, status: :created, location: @customer_segment }
      else
        format.html { render action: "new" }
        format.json { render json: @customer_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customer_segments/1
  # PUT /customer_segments/1.json
  def update
    @customer_segment = CustomerSegment.find(params[:id])

    respond_to do |format|
      if @customer_segment.update_attributes(params[:customer_segment])
        format.html { redirect_to [current_user,@idea,@customer_segment], notice: 'Customer segment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_segments/1
  # DELETE /customer_segments/1.json
  def destroy
    @customer_segment = CustomerSegment.find(params[:id])
    @customer_segment.destroy

    respond_to do |format|
      format.html { redirect_to user_idea_customer_segments_url(current_user,@idea) }
      format.json { head :no_content }
    end
  end

  private

  def get_idea
    @idea = Idea.find(params[:idea_id])
  end
end

class IdeasController < ApplicationController
  load_and_authorize_resource
  # GET /ideas
  # GET /ideas.json
  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @user = User.find(params[:user_id])
    @idea = @user.ideas.find(params[:id])
    @customer_segments = @idea.customer_segments#list only three most important segments
    @problems = @idea.problems
    @solutions = @idea.solutions
    @metrics = @idea.metrics
    @uvps = @idea.uvps
    @advantages = @idea.advantages
    @channels = @idea.channels
    @structure = @idea.structure
    @revenue = @idea.revenue

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
      format.pdf do
        pdf = IdeaPdf.new(@idea)
        send_data pdf.render,filename: @idea.title,
                             type: "application/pdf",
                             disposition: "inline"
      end
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = current_user.ideas.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.new(params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to [current_user,@idea], notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = current_user.ideas.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to [current_user,@idea], notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to user_ideas_url(current_user) }
      format.json { head :no_content }
    end
  end
end

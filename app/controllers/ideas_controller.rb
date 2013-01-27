#encoding: utf-8
class IdeasController < ApplicationController
  load_and_authorize_resource
  after_filter :set_user, only: :create
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
    if params[:id]
      @idea = Idea.find(params[:id])
    elsif params[:key]
      @idea = Idea.find_by_key(params[:key])
    end
    @user = current_user if @idea.users.include?(current_user)
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
    @idea = Idea.new

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
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
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
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /ideas/1
  # PUT /ideas/1.json
  def add_user
    @idea = current_user.ideas.find(params[:id])
    user = User.find_by_email(params[:email])
    if user
      @idea.users << user
      respond_to do |format|
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      end
    else
      redirect_to @idea, notice: "无法找到该用户，请确保该邮箱已经注册成功。"
    end

  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def delete_user
    @idea = current_user.ideas.find(params[:id])
    user = User.find_by_email(params[:email])
    if user != @idea.users.first
      @idea.users.delete(user)
      respond_to do |format|
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      end
    else
      redirect_to @idea, notice: "您没有权限删除该用户"
    end

  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to user_url(current_user) }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @idea.users << current_user
  end
end

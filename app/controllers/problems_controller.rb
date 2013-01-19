class ProblemsController < ApplicationController

  before_filter :get_idea
  # GET /problems
  # GET /problems.json
  def index
    @problems = @idea.problems.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = @idea.problems.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem }
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    @problem = @idea.problems.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem }
    end
  end

  # GET /problems/1/edit
  def edit
    @problem = @idea.problems.find(params[:id])
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = @idea.problems.new(title: params[:toSent])

    if @problem.save
      render json: { text: "success", id: "#{@problem.id}" }
    else
      render json: { text: "fail"}
    end
  end

  # PUT /problems/1
  # PUT /problems/1.json
  def update
    @problem = @idea.problems.find(params[:id])

    if @problem.update_attributes(params[:problem])
      render json: { text: "success"}
    else
      render json: { text: "fail"}
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    render json: { text: "success"}
  end

  private

end

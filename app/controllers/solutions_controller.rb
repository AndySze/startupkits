class SolutionsController < ApplicationController
  before_filter :get_idea
  # GET /solutions
  # GET /solutions.json
  def index
    @solutions = @idea.solutions.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @solutions }
    end
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
    @solution = @idea.solutions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solution }
    end
  end

  # GET /solutions/new
  # GET /solutions/new.json
  def new
    @solution = @idea.solutions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solution }
    end
  end

  # GET /solutions/1/edit
  def edit
    @solution = @idea.solutions.find(params[:id])
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = @idea.solutions.new(feature: params[:toSent]) #@idea.solutions.new(params[:solution])

    if @solution.save
      render json: { text: "success", id: "#{@solution.id}" }
    else
      render json: { text: "fail"}
    end
  end

  # PUT /solutions/1
  # PUT /solutions/1.json
  def update
    @solution = @idea.solutions.find(params[:id])

    if @solution.update_attributes(params[:solution])
      render json: { text: "success" }
    else
      render json: { text: "fail"}
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy

    render json: { text: "success" }
  end
end

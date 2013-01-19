class StructuresController < ApplicationController
  before_filter :get_idea
  # POST /structure
  # POST /structure.json
  def create
    @structure = @idea.structure.new(title: params[:toSent]) # @idea.structure.new(params[:structure]) #change to ajax

    if @structure.save
      #format.html { redirect_to [current_user,@idea,@structure], notice: 'Customer segment was successfully created.' }
      render :json => {text: 'success',id: "#{@structure.id}" }
    else
      #format.html { render action: "new" }
      render :json => {text: 'fail' }
    end
  end

  # PUT /structure/1
  # PUT /structure/1.json
  def update
    @structure = CustomerSegment.find(params[:id])

    if @structure.update_attributes(params[:structure])
      render json: { text: "success"}
    else
      render json: { text: "fail" }
    end
  end

  # DELETE /structure/1
  # DELETE /structure/1.json
  def destroy
    @structure = @idea.structure.find(params[:id])
    @structure.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end

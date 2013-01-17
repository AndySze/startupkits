class RevenuesController < ApplicationController
  before_filter :get_idea
  # POST /revenue
  # POST /revenue.json
  def create
    @revenue = @idea.revenue.new(title: params[:toSent]) # @idea.revenue.new(params[:revenue]) #change to ajax

    if @revenue.save
      #format.html { redirect_to [current_user,@idea,@revenue], notice: 'Customer segment was successfully created.' }
      render :json => {text: 'success',id: "#{@revenue.id}" }
    else
      #format.html { render action: "new" }
      render :json => {text: 'fail' }
    end
  end

  # PUT /revenue/1
  # PUT /revenue/1.json
  def update
    @revenue = CustomerSegment.find(params[:id])

    respond_to do |format|
      if @revenue.update_attributes(params[:revenue])
        format.html { redirect_to [current_user,@idea,@revenue], notice: 'Customer segment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @revenue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revenue/1
  # DELETE /revenue/1.json
  def destroy
    @revenue = @idea.revenue.find(params[:id])
    @revenue.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end

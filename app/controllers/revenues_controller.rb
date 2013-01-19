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

    if @revenue.update_attributes(params[:revenue])
      render json: { text: "success"}
    else
      render json: { text: "fail"}
    end
  end

  # DELETE /revenue/1
  # DELETE /revenue/1.json
  def destroy
    @revenue = @idea.revenue.find(params[:id])
    @revenue.destroy

    render json: { text: "success"}
  end
end


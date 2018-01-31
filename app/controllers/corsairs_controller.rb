class CorsairsController < ApplicationController


  def index
    @corsairs = Corsair.all
  end

  def new
	@corsair = Corsair.new
  end 

  def show
	@corsair = Corsair.find(params[:id])
  end

  def edit
	 @corsair = Corsair.find(params[:id])
  end


  def create
	@corsair = Corsair.new(corsair_params)
	if @corsair.save
	  redirect_to @corsair
	else render 'new'
	end
  end


  def update
  	@corsair = Corsair.find(params[:id])
	  if @corsair.update(corsair_params)
	    redirect_to corsairs_path
	  else 
	    render 'edit'
	  end
	end
	

private

  def corsair_params
    params.require(:corsair).permit(:first_name, :age, :likeness)
  end


end

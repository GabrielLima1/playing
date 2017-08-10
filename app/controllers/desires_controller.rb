class DesiresController < ApplicationController
  before_action :set_desire, only: [:edit, :update, :show, :destroy]

  	def new
  		@desire = Desire.new
  	end

  	def create
  		@desire = Desire.create(desire_params)
  		respond_with @desire
  	end

  	def update
  		@desire.update(desire_params)
      	respond_with @desire
  	end

  	def show
  		respond_with @desire
  	end


  	def index
      @desires = Desire.where(user_id: current_user.id)
  		#@desires = Desire.all.order(:created_at)
  		#  @desires = Desire.paginate(:page => params[:page])
      #                           		.order(created_at: :asc)
  	end

  	def destroy
  		@desire.destroy
  		redirect_to desires_path, alert: "Pedido Deletado"
  	rescue
  		redirect_to desires_path, alert: "Não foi possivel deletar"
  	end

  	private
  	def set_desire
  		@desire = Desire.find(params[:id])
  	end

  	def desire_params
      params.require(:desire).permit(:title, :action, :status ,:description, :company_id, :user_id, :img1, :img2, :img3)
  	end
end

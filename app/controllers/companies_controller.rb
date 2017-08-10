class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update, :show, :destroy]

	def new
		@company = Company.new
	end

	def create
		@company = Company.create(company_params)
		respond_with @company
	end

	def update
		@company.update(company_params)
    	respond_with @company
	end

	def show
		respond_with @company
	end


	def index
		#@companies = Company.all.order(:created_at)
    @companies = Company.where(user_id: current_user.id)
		#  @companies = Company.paginate(:page => params[:page])
    #                           		.order(created_at: :asc)
	end

	def destroy
		@company.destroy
		redirect_to companies_path, alert: "Empresa Deletada"
	rescue
		redirect_to companies_path, alert: "Não foi possivel deletar"
	end

	private
	def set_company
		@company = Company.find(params[:id])
	end

	def company_params
		params.require(:company).permit(:name, :description, :logo, :user_id)
	end
end

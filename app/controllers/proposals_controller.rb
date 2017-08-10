class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:edit, :update, :show, :destroy]

	def new
		@proposal = Proposal.new
	end

	def create
    desire = params[:proposal][:desire_id]
    user = Desire.find(desire)
    params[:proposal][:user_id] = user.user_id
		@proposal = Proposal.create(proposal_params)
    binding.pry
    #@proposal(:desire_id)
		respond_with @proposal
	end

	def update
		@proposal.update(proposal_params)
    	respond_with @proposal
	end

	def show
		respond_with @proposal
	end


	def index
    @proposals = Proposal.where(user_id: current_user.id)
		#@proposals = Proposal.all.order(:created_at)
		#  @proposals = Proposal.paginate(:page => params[:page])
    #                           		.order(created_at: :asc)
	end

	def destroy
		@proposal.destroy
		redirect_to proposals_path, alert: "Proposata Deletada"
	rescue
		redirect_to proposals_path, alert: "Não foi possivel deletar"
	end

	private
	def set_proposal
		@proposal = Proposal.find(params[:id])
	end

	def proposal_params
    params.require(:proposal).permit(:message, :status ,:notes, :proposal_id, :user_id, :img1, :img2, :img3)
	end
end

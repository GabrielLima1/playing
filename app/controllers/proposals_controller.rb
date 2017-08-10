class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:edit, :update, :show, :destroy]

	def new
    if current_user.kind =="manager"
  		@proposal = Proposal.new
      @desire =  Desire.find(params[:id])
    else
      redirect_to proposals_path, alert: "Proposata Deletada"
    end
	end

	def create
    #binding.pry
    id = params[:proposal][:desire_id]
    desire = Desire.find(id)
    params[:proposal][:user_id] = desire.user_id
		@proposal = Proposal.create(proposal_params)
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
    if current_user.kind == "client"
      @proposals = Proposal.where(user_id: current_user.id)
    else
      @proposals = Proposal.paginate(:page => params[:page])
                                     .order(created_at: :asc)
    end
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
    params.require(:proposal).permit(:message, :status ,:notes, :proposal_id, :desire_id, :user_id, :img1, :img2, :img3)
	end
end

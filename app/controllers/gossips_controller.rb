class GossipsController < ApplicationController
	def new
		@gossip = Gossip.new
	end

	def create
		@gossip = Gossip.new (gossip_params)
		@gossip.save
	redirect_to @gossip
	end

	def show
		@gossip = Gossip.find(params[:id])
	end

	def edit
		@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		@gossip.anonymous_author = gossip_params[:anonymous_author]
		@gossip.content = gossip_params[:content]
		@gossip.save
	end

	def index
	 	@gossip = Gossip.all
	end

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
	redirect_to gossips_path
	end
private
  def gossip_params
	params[:gossip].permit(:anonymous_author, :content)
  end
end

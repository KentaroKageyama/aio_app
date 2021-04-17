class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = Client.all
    @client = Client.new
  end

  def create
    @client = Client.new(set_client)
    @client.save

    redirect_to action: :index
  end

  def update
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy

    redirect_to action: :index
  end

  private

  def set_client
    params.require(:client).permit(:name, :percentage).merge(user_id: current_user.id)
  end

end

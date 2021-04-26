class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = Client.all
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
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

  def client_params
    params.require(:client).permit(:name, :percentage)
  end

end

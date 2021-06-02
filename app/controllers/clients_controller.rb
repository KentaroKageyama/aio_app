class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:edit, :update, :destroy]

  def index
    @clients = Client.all
    @client = Client.new
  end

  def create
    @clients = Client.all
    @client = Client.new(client_params)
    if @client.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  def edit
  end

  def update
    @client.update(client_params)
    redirect_to action: :index
  end

  def destroy
    @client.destroy
    redirect_to action: :index
  end

  private

  def client_params
    params.require(:client).permit(:name, :percentage)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end

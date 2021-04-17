class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def create
    collection = Collection.new(collection_params)
    collection.save
    redirect_to new_other_items_path
  end

  def destroy
    collection = Collection.find(params[:id])
    collection.destroy
    redirect_to new_other_items_path
  end

  def sort
    collection = Collection.find_by(position: params[:from].to_i + 1)
    collection.insert_at(params[:to].to_i + 1)
    head :ok
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end

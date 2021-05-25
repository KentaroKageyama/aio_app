class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, only: [:edit, :update, :destroy]

  def create
    collection = Collection.new(collection_params)
    collection.save
    redirect_to new_other_items_path
  end

  def edit
  end

  def update
    @collection.update(collection_params)
    redirect_to new_other_items_path
  end

  def destroy
    @collection.destroy
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

  def set_collection
    @collection = Collection.find(params[:id])
  end
end

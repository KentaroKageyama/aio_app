class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:edit, :update, :destroy]

  def index
    @invoices = Invoice.all.order(issue_date: :DESC)
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to post_pdf_index_path(format: 'pdf', invoice_id: @invoice.id, client_id: params[:invoice][:client_id])
    else
      render :new
    end
  end

  def edit
    @client = Client.find_by(name: @invoice.client_name)
  end

  def update
    @client = Client.find_by(name: @invoice.client_name)
    if @invoice.update(invoice_params)
      redirect_to post_pdf_index_path(format: 'pdf', invoice_id: @invoice.id, client_id: params[:invoice][:client_id])
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    redirect_to action: :index
  end

  private

  def invoice_params
    if params[:invoice][:client_id].present?
      client = Client.find(params[:invoice][:client_id])
      params.require(:invoice).permit(:issue_date, :issue_number, :content, invoice_items_attributes: [:id, :chain_item, :size, :quantity, :price, :_destroy]).merge(
      client_name: client.name, client_percentage: client.percentage
      )
    end
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end

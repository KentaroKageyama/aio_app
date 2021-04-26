class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @invoices = Invoice.all.order(issue_date: :DESC)
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.save

    redirect_to post_pdf_index_path(format: "pdf", invoice_id: @invoice.id, client_id: params[:invoice][:client_id])
  end

  def edit
    @invoice = Invoice.find(params[:id])
    @client = Client.find_by(name: @invoice.client_name)
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(invoice_params)
    redirect_to post_pdf_index_path(format: "pdf", invoice_id: @invoice.id, client_id: params[:invoice][:client_id])
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to action: :index
  end

  private

  def invoice_params
    client = Client.find(params[:invoice][:client_id]) if params[:invoice][:client_id].present?
    params.require(:invoice).permit(:issue_date, :issue_number, :content, invoice_items_attributes: [:chain_item, :size, :quantity, :price, :_destroy]).merge(client_name: client.name, client_percentage: client.percentage)
  end

end

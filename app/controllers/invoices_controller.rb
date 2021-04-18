class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(set_invoice)
    @invoice.save

    redirect_to post_pdf_index_path(format: "pdf", invoice_id: @invoice.id, client_id: params[:invoice][:client_id])
  end

  private

  def set_invoice
    params.require(:invoice).permit(:issue_date, :issue_number, invoice_items_attributes: [:collection, :item, :category, :opal_color, :size, :quantity, :price, :_destroy])
  end

end

class PostPdfController < ApplicationController
  def index
    @test = params[:test]
    respond_to do |format|
      format.html
      format.pdf do
        post_pdf = PostPdf.new(@test).render

        send_data post_pdf,
          filename: 'post_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
      end
    end
  end
end
class PostPdfController < ApplicationController
  def index
    @test = params[:test]
    @user = User.find(current_user.id)
    respond_to do |format|
      format.html
      format.pdf do
        post_pdf = PostPdf.new(@test, @user).render

        send_data post_pdf,
          filename: 'post_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
      end
    end
  end
end
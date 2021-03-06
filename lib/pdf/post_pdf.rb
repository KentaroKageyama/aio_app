class PostPdf < Prawn::Document
  def initialize(invoice, user, client)
    @invoice = invoice
    @user = user
    @client = client
    @items = @invoice.invoice_items
    super(
      page_size: 'A4',
      top_margin: 80,
      bottom_margin: 60,
      left_margin: 40,
      right_margin: 40
    )
    # 座標を表示
    # stroke_axis

    font 'app/assets/fonts/SourceHanSans-Normal.ttc'

    create_contents
    number_pages('<page> / <total>', at: [bounds.right - 280, -5], size: 10)
  end

  def create_contents
    bounding_box([370, 750], width: 100, height: 40) do
      text "発行日: #{@invoice.issue_date}", size: 11, align: :right
      move_down 2
      text "No.#{@invoice.issue_number}", size: 11, align: :right
    end

    bounding_box([20, 715], width: 10, height: 30) do
      data = [['']]
      table(data, cell_style: { background_color: '000000' }) do |table|
        table.cells.size = 10
        table.cells.height = 25
      end
    end

    bounding_box([40, 713], width: 310, height: 40) do
      text '請求書', size: 20, align: :left
    end

    bounding_box([40, 660], width: 300, height: 150) do
      text "#{@client.name} 御中", size: 17, align: :left
      move_down 15
      text '東京店 1月売上分', size: 14, aligh: :left
    end

    bounding_box([360, 660], width: 300, height: 150) do
      text @user.company.to_s, size: 12
      move_down 10
      text "〒#{@user.zip_code[0..2]}-#{@user.zip_code[3..6]}", size: 10
      move_down 5
      text "#{@user.prefecture.name} #{@user.city}", size: 10
      move_down 5
      text @user.address.to_s, size: 10
      move_down 5
      text @user.building.to_s, size: 10
      move_down 5
      text "TEL: #{@user.phone_number}", size: 10
    end

    image 'app/assets/images/logo.png', at: [265, 660], width: 80

    bounding_box([30, 550], width: 310, height: 65) do
      data = [['御請求金額', "¥ #{all_total.to_s(:delimited)}(税込)"]]
      table(data, column_widths: [90, 160]) do |table|
        table.cells.size = 14
        table.cells.height = 28
        table.cells.padding = 7
        table.column(1).align = :right
        table.column(0).background_color = 'd0d0d0'
        table.column(0).size = 13
      end
    end

    bounding_box([328, 550], width: 250) do
      table [['小計', "¥#{subtotal.to_s(:delimited)}"], ['消費税', "¥#{tax.to_s(:delimited)}"], ['合計金額', "¥#{(subtotal + tax).to_s(:delimited)}"], ['掛け率', "#{@client.percentage}%"]],
            column_widths: [70, 90], position: :left do |table|
        table.cells.size = 9
        table.column(0).background_color = 'e0e0e0'
        table.column(1).align = :right
      end
    end

    move_down 15
    num = 1
    rows = [['No.', '作品名', '数量', '単価', '金額']]
    @items.each do |item|
      rows << [num.to_s, item.chain_item.to_s, item.quantity.to_s, item.price.to_s(:delimited).to_s,
               (item.price * item.quantity).to_s(:delimited).to_s]
      num += 1
    end

    table(rows, column_widths: [30, 290, 30, 55, 55], position: :center) do |table|
      table.cells.size = 7
      table.row(0).background_color = 'e0e0e0'

      table.column(0).align = :right
      table.column(2..4).align = :right

      table.row(0).align = :center
    end

    move_down 15

    table [['お振込先：', "#{@user.bank} #{@user.branch}   #{@user.bank_type.name} #{@user.bank_number}   #{@user.bank_account}"]],
          column_widths: [100, 360], position: :center do |table|
      table.column(0).background_color = 'e0e0e0'
      table.cells.size = 9
    end
  end

  def subtotal
    sub = 0
    @items.each do |item|
      sub += item.price * item.quantity
    end
    sub
  end

  def tax
    tax = (subtotal * 0.1).floor
  end

  def all_total
    ((subtotal + tax) * @client.percentage / 100).floor
  end
end

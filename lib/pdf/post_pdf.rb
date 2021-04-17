class PostPdf < Prawn::Document
  def initialize(test, user)

    @test = test
    @user = user

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
    number_pages('<page> / <total>', at: [bounds.right - 280, -5], :size => 10 )

  end
  

  # コンポーネント作成
  def create_contents
    
    # bunding_boxメソッドでボックスを生成
    # 引数にはボックス生成位置、横、縦のサイズを指定
    bounding_box([370, 750], width: 100, height: 40) do
      text "2020年10月01日", size: 11, align: :right
      move_down 2
      text "No.00000000", size: 11, align: :right
    end

    bounding_box([20, 715], width: 10, height: 30) do
      data = [ [""] ]
      table(data, :cell_style => {:background_color => "000000"}) do |table|
        table.cells.size = 10
        table.cells.height = 25
      end
    end

    bounding_box([40, 713], width: 310, height: 40) do
      text "#{@test}", size: 20, align: :left
    end

    bounding_box([40, 660], width: 300, height: 150) do
      text "fugafuga株式会社 御中", size: 17, align: :left
      move_down 15
      text "東京店 1月売上分", size: 14, aligh: :left
    end

    bounding_box([330, 660], width: 300, height: 150) do
      text "#{@user.company}", size: 12
      move_down 10
      text "〒#{@user.zip_code[0..2]}-#{@user.zip_code[3..6]}", size: 10
      move_down 5
      text "#{@user.prefecture.name} #{@user.city} #{@user.address}", size: 10
      move_down 5
      text "#{@user.building}", size: 10
      move_down 5
      text "TEL: #{@user.phone_number}", size: 12
    end


    bounding_box([40, 550], width: 310, height: 65) do
      data = [ ["御請求金額", "¥ 5,500(税込)"] ]
      table(data, :column_widths => [90, 160]) do |table|
        table.cells.size = 14
        table.cells.height = 28
        table.cells.padding = 7
        table.column(1).align = :right
        table.column(0).background_color = 'd0d0d0'
        table.column(0).size = 13
      end
    end

    bounding_box([330, 550], width: 250) do
      table [['小計', "¥10000"], ['消費税', "¥1000"], ['合計金額', "¥11000"], ['掛け率', "50%"]], column_widths: [70, 90], position: :left do |table|
        table.cells.size = 9
        table.column(0).background_color = 'e0e0e0'
        table.column(1).align = :right
      end
    end
    
    move_down 15

    rows = [['詳細', '数量', '単価', '金額'], ['雑費', '1', '10000', '10000']]
    rows << ['test1', 'test2', 'test3', 'test4']
    rows << ['test1', 'test2', 'test3', 'test4']
    rows << ['test1', 'test2', 'test3', 'test4']

    table(rows, column_widths: [280, 40, 50, 50], position: :center) do |table|
      table.cells.size = 8
      table.row(0).background_color = "e0e0e0"

      table.column(1..3).align = :right
      table.row(0).align = :center
    end

    move_down 15

    table [["お振込先：", "#{@user.bank} #{@user.branch}   #{@user.bank_type.name} #{@user.bank_number}   #{@user.bank_account}"]], column_widths: [90, 332], position: :center do |table|
      table.column(0).background_color = 'e0e0e0'
      table.cells.size = 9
    end
  end
end
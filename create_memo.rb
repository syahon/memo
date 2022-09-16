require 'CSV'

class Memo

  def input_file_name
    puts "拡張子を除いたファイル名を入力してください"
    @file_name = gets.chomp
  end

  def input_text(word)
    puts "#{word}したい内容を記入してください"
    puts "完了したらCtrl-Dを押します"
    text = readlines(chomp: true)
    CSV.open("./#{@file_name}.csv", "a") do |csv|
      csv << text
    end
    puts "入力内容を#{word}しました"
  end

  def file_exist?
    File.exist?("./#{@file_name}.csv")
  end

  def create_csv
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する   ※半角入力"
    memo_type = gets.to_i

    case memo_type
    when 1
      input_file_name
      file_exist? ? (puts "既に#{@file_name}.csvファイルは存在しています") : input_text("メモ")
    when 2
      input_file_name
      file_exist? ? input_text("追記") : (puts "#{@file_name}.csvファイルは存在しません")
    else
      puts "終了"
    end
  end

end

Memo.new.create_csv
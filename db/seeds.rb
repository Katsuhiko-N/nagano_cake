# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Admin生成開始"

Admin.create!(
    email: "admin@example.com",
    password: "zzzzzz"
)

puts "Admin生成完了"

ActiveRecord::Base.transaction do
    
    puts "ジャンル作成開始"
    Genre.find_or_create_by!(id: "1") do |genre|
        genre.name = "ジャンル1"
    end
    
    Genre.find_or_create_by!(id: "2") do |genre|
        genre.name = "ジャンル2"
    end
    
    Genre.find_or_create_by!(id: "3") do |genre|
        genre.name = "ジャンル3"
    end
    puts "ジャンル生成終了"
    
    puts "商品生成開始"
    Item.find_or_create_by!(id: "1") do |item|
	    item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_s.jpg"), filename:"sample-1.jpg")
	    item.name = "サンプル1"
	    item.introduction = "サンプル"
	    item.price = "1100"
	    item.is_active = true
	    item.genre_id = "1"
	end
    
    Item.find_or_create_by!(id: "2") do |item|
	    item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_s.jpg"), filename:"sample-2.jpg")
	    item.name = "サンプル2"
	    item.introduction = "サンプル"
	    item.price = "2200"
	    item.is_active = true
	    item.genre_id = "2"
	end
    
    Item.find_or_create_by!(id: "3") do |item|
	    item.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample_s.jpg"), filename:"sample-3.jpg")
	    item.name = "サンプル3"
	    item.introduction = "サンプル"
	    item.price = "3300"
	    item.is_active = true
	    item.genre_id = "3"
	end
    puts "商品生成終了"
    
    
    
end
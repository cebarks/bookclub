namespace :seed do
  desc "Generate seeds"
  task :generate do
    require 'faker'

    require 'pry'; binding.pry

    num = 50
    num.times do
      book = Faker::Book.unique

      CSV.open("", "wb") do |books|
        books << [book.title, ]
      end

      CSV.open("", "wb") do |authors|

      end
    end
  end
end

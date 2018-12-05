class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :title
      t.integer :pages
      t.text :pub_date

      t.timestamps
    end
  end
end

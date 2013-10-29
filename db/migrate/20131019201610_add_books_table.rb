class AddBooksTable < ActiveRecord::Migration
  def change
    create_table :books do |b|
      b.string :name, :null => false
      b.text :description
      b.boolean :available, :default => true, :null => false
      b.timestamps
    end

  end

end

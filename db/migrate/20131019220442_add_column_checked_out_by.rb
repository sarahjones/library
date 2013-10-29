class AddColumnCheckedOutBy < ActiveRecord::Migration
  def up

    change_table :books do |b|
      b.belongs_to :checked_out_by
    end
  end

  def down
    remove_column books, :checked_out_by
  end
end

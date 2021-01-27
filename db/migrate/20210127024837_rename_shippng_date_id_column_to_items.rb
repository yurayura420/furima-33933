class RenameShippngDateIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shippng_date_id, :shipping_date_id
  end
end

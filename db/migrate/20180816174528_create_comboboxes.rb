class CreateComboboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :comboboxes do |t|
      t.string :cnpj
      t.string :contract
      t.string :campaign

      t.timestamps
    end
  end
end

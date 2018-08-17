class AddKindToCombobox < ActiveRecord::Migration[5.0]
  def change
    add_reference :comboboxes, :kind, foreign_key: true
  end
end

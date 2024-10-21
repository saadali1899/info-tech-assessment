class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :message
      t.references :user

      t.timestamps
    end
  end
end

class CreateInstractors < ActiveRecord::Migration[6.1]
  def change
    create_table :instractors do |t|
      t.string :name

      t.timestamps
    end
  end
end

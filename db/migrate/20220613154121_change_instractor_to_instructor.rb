class ChangeInstractorToInstructor < ActiveRecord::Migration[6.1]
  def change
    rename_table :instractors, :instructors

  end
end

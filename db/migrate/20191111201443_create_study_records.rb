class CreateStudyRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :study_records do |t|
      t.string :title
      t.time :study_time
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end

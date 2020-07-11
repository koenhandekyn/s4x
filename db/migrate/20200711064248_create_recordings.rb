class CreateRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings do |t|
      t.string :name
      t.timestamp :record_at
      t.string :source_uri
      t.string :duration

      t.timestamps
    end
  end
end

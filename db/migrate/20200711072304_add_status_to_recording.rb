class AddStatusToRecording < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :status, :string
  end
end

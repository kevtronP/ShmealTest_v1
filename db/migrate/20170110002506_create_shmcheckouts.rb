class CreateShmcheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :shmcheckouts do |t|
      t.string :nonce
      t.float :amount
      t.string :merchantID

      t.timestamps
    end
  end
end
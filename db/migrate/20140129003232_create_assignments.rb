class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :product, index: true
      t.belongs_to :cat, index: true

      t.timestamps
    end
  end
end

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :reference
      t.text :tasktext
      t.text :rule
      t.text :encourag
      t.string :badgepath
      t.text :badgetext

      t.timestamps
    end
  end
end

class AddHighlighttextToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :highlighttext, :text
  end
end

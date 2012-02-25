class Task < ActiveRecord::Base

	def next_task
	  self.class.first(:conditions => ["id > ?", id],:order => "id asc")
	end
end

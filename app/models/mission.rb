class Mission < ActiveRecord::Base
	validates :title, :content, :points, :take_mission, :begin_date, :final_date, presence: true
	validates :points, numericality: {greater_than: 0}
	#validates :take_mission, booleano #si o no?

	#Una misión tiene varios fans
	has_many :fans

	#Y una misión le pertenece a un sólo artista
	belongs_to :artists
	
end

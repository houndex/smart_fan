class Artist < ActiveRecord::Base
	validates :name ,:email ,:phone ,:bio ,:photo, presence: {message: "Este campo es obligatorio"}
	
	validates :name, :email, uniqueness: true
	validates :phone, numericality: {greater_than: 0}, length: {in: 1..14}


	#Un artista tiene varios fans y varios fans acceden a varios artistas
	has_and_belongs_to_many :fans

	#Un artista asigna varias misiones 
	has_many :missions

		
end

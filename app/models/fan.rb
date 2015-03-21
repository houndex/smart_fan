class Fan < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#Validaciones para las columnas que conforman la clase Fan
	#validates :name, :email, :age, :country, :city, presence: {message: "Este campo es obligatorio"}
	

	#validates :age, numericality: {greater_than: 0}
	#validates :name, uniqueness: true

	#Un fan pertenece a varios artistas y un artista pertenece a varios fans
	belongs_to :artists

	#Un fan puede aceptar varias misiones y a una misión acceden varios fans
	has_and_belongs_to_many :missions

	def login
		Fan.where(email: self.email, password: self.password).first
	end

	#callback para enviar email
	def send_email
		# RegisterMailer.registration(self).deliver_now
    SendEmailJob.set(wait: 20.seconds).perform_later(self)
  	end


end

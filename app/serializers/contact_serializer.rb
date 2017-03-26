class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind #, optional: true 
	has_one :address
	has_many :phones

	meta do
		{ author: "Cristi Allan" }
	end

  def attributes(*args)
		h = super(*args)
		#h[:birthdate] = ( I18n.l(object.birthdate) unless object.birthdate.blank? ) pt-BR
		h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
		h
	end
end

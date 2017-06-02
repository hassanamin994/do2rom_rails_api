class Price
  include Mongoid::Document
  include Mongoid::Timestamps
  field :location, type: String
  field :image, type: String
  field :price, type:Integer
  has_and_belongs_to_many :confirmations , class_name: "User"
  has_and_belongs_to_many :disconfirmations , class_name: "User"
  belongs_to :user, dependent: :delete, validate: false
  belongs_to :product, dependent: :delete, validate: false

  def confirm!(user)
    if self.user != user 
    	if !self.confirmations.include?(user)
    		if self.disconfirmations.include?(user)
      			self.disconfirmations.delete user
      		end
      		self.confirmations << user
      		nil
      	else
      		self.confirmations.delete user 
      		nil
      	end
    else
    	"you can't confrime your own price"
    end
    
  end

  def disconfirm!(user)
    if self.user != user 
    	if !self.disconfirmations.include?(user)
    		if self.confirmations.include?(user)
      			self.confirmations.delete user
      		end
      		self.disconfirmations << user
      		nil
      	else
      		self.disconfirmations.delete user 
      		nil
      	end
    else
    	"you can't disconfrime your own price"
    end
  end
end

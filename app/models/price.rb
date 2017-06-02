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
    		if !self.disconfirmations.include?(user)
      			self.confirmations << user
      			Nil
      		else
      			"you can't confirm and disconfirm a price"
      		end
      	else
      		"you can't confirm a price twice"
      	end
    else
    	"you can't confrime your own price"
    end
    
  end

  def disconfirm!(user)
    if self.user != user 
    	if !self.disconfirmations.include?(user)
    		if !self.confirmations.include?(user)
      			self.disconfirmations << user
      			Nil
      		else
      			"you can't confirm and disconfirm a price"
      		end
      	else
      		"you can't disconfirm a price twice"
      	end
    else
    	"you can't disconfrime your own price"
    end
  end
end

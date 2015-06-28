class Meeting < ActiveRecord::Base
  has_many  :relationships
  has_many :users , :through  => :relationships

  def dates
  	date = Date.today
  	dates = []
    dates << date
  	20.times do 
	  	date = date.advance(:days => 1)
	  	dates << date
  	end
  	dates
  end
end

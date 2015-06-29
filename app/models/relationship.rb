class Relationship < ActiveRecord::Base
	belongs_to :meeting, dependent: :destroy
	belongs_to :user , dependent: :destroy
end

class Book  < ActiveRecord::Base

  attr_accessible :available, :checked_out_by

  belongs_to :checked_out_by, :class_name => 'User'

end
class Monument < ActiveRecord::Base
    belongs_to :collection
    validates :name, presence: true, :length => { :maximum => 100 }
end

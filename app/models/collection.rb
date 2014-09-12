class Collection < ActiveRecord::Base
    belongs_to :user
    has_many :monuments
    validates :name, presence: true, :length => { :maximum => 100 }
end

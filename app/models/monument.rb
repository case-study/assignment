class Monument < ActiveRecord::Base
    belongs_to :collection
    belongs_to :user
    has_many :pictures
    validates :name, presence: true, :length => { :maximum => 100 }

    acts_as_taggable
    acts_as_taggable_on :categories
end

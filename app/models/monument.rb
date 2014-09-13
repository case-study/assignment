class Monument < ActiveRecord::Base
    acts_as_taggable
    acts_as_taggable_on :categories

    belongs_to :collection
    belongs_to :user
    has_many :pictures
    validates :name, presence: true, :length => { :maximum => 100 }
end

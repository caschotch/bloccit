class Post < ActiveRecord::Base
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    default_scope { order('created_at DESC') }
    #found a stack overflow stating that due to default need to use reorder to accurately get it to work
    #my answers
    scope :ordered_by_title, -> { reorder(title: :desc) }
    scope :ordered_by_reverse_created_at, -> { reorder(created_at: :asc) }
    
    #testing the video answers to my answers to understand what the difference is
    scope :ordered_by_title_two, -> { order('title DESC') }
    scope :ordered_by_reverse_created_at_two, -> { order('created_at ASC') }
    
    #conclusion - both run the same per the rails console, still not sure why reorder was stated to be needed
    
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
    
end

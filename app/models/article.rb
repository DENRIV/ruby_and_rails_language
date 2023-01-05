=begin
class Article < ApplicationRecord
    # added 1
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    # end added 1

    # added 2
    has_many :comments
    # end added 2
end
=end

=begin
# added 3
class Article < ApplicationRecord
    has_many :comments
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  
    VALID_STATUSES = ['public', 'private', 'archived']
  
    validates :status, inclusion: { in: VALID_STATUSES }
  
    def archived?
      status == 'archived'
    end
  end
# end added 3  
=end

# added 4
class Article < ApplicationRecord
    include Visible
  
    #has_many :comments
    has_many :comments, dependent: :destroy # Deleting Associated Objects
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  # end added 4
# added 1
=begin
module Visible
    def archived?
      status == 'archived'
    end
  end
=end
# end added 1

# added 2
module Visible
    extend ActiveSupport::Concern
  
    VALID_STATUSES = ['public', 'private', 'archived']
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
  
    # added 3
    class_methods do
        def public_count
          where(status: 'public').count
        end
      end
    # end added 3  

    def archived?
      status == 'archived'
    end

  end
# end added 2

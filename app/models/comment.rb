=begin
class Comment < ApplicationRecord
  belongs_to :article
end
=end

=begin
# added 1
class Comment < ApplicationRecord
  belongs_to :article

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
# added 2
=end

class Comment < ApplicationRecord
  include Visible

  belongs_to :article
end

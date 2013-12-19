module AR
  class Field < ActiveRecord::Base
    belongs_to :template
    belongs_to :parent, class_name: 'Field'
    has_many :children, class_name: 'Field', foreign_key: :parent_id
  end
end

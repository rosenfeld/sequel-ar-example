module Sq
  class Field < Sequel::Model
    many_to_one :template
    many_to_one :parent, class: 'Sq::Field'
    one_to_many :children, class: 'Sq::Field', key: :parent_id
  end
end

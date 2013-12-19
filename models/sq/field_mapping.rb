module Sq
  class FieldMapping < Sequel::Model
    set_primary_key [:field_id, :mapped_field_id]
  end
end

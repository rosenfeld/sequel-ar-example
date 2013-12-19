module Sq
  class Template < Sequel::Model
    one_to_many :fields

    def mapped_template_ids
      FieldMapping.as(:m).
        join(Field.named(:f), id: :field_id, template_id: id).
        join(Field.named(:mf), id: :m__mapped_field_id).
        distinct.select_map(:mf__template_id)
    end
  end
end

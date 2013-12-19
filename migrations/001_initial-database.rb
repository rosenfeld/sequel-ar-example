Sequel.migration do
  change do
    create_table :templates do
      primary_key :id
      String :name, null: false
    end

    create_table :fields do
      primary_key :id
      String :name, null: false
      foreign_key :parent_id, :fields
      foreign_key :template_id, :templates
      index :parent_id
      index :template_id
      index :name
    end

    create_join_table({ field_id: :fields, mapped_field_id: :fields },
      name: :field_mappings)
    # Same as:
    # create_table :field_mappings do
    #   foreign_key :field_id, :fields, null: false
    #   foreign_key :mapped_field_id, :fields, null: false
    #   primary_key [:field_id, :mapped_field_id]
    #   index [:mapped_field_id, :field_id]
    # end
  end
end

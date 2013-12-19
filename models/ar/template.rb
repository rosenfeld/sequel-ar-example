module AR
  class Template < ActiveRecord::Base
    has_many :fields
  end
end

require 'bundler/setup'
Bundler.require :default

DB = Sequel::Model.db = Sequel.connect 'postgres://localhost/exampledb',
  max_connections: 1
ActiveRecord::Base.establish_connection adapter: 'postgresql', host: 'localhost',
  database: 'exampledb', pool: 1

models_path = "#{__dir__}/models"
Dir["#{models_path}/**/*.rb"].each do |fn|
  require fn.sub(/#{models_path}\/(.*)\.rb/, '\1')
end

module Sequel::Plugins::AliasSupport
  module ClassMethods
    def as(alias_name)
      from named alias_name
    end

    def named(alias_name)
      Sequel.as table_name, alias_name
    end
  end
end
Sequel::Model.plugin :alias_support

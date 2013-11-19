require 'rubygems'
require 'rspec'
require 'active_model'
require 'global_phone'

GlobalPhone.db_path = File.join(File.dirname(__FILE__), '..', 'spec', 'db', 'global_phone.json')

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'phone_validator'

class TestModel
  include ActiveModel::Validations

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
end
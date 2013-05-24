require 'test/unit'
require_relative '../bootstrap_ar'

connect_to 'test'


# ENV['CAR_ENV'] = 'test'

module DatabaseCleaner
  def before_setup
    super
    Vehicle.destroy_all
  end
end
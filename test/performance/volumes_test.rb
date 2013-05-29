require 'test_helper'
require 'rails/performance_test_help'

class VolumesTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }
  self.profile_options = { :runs => 20, :metrics => [:wall_time], :formats => [:flat] }
  
  def test_homepage
    get '/'
  end

  def test_page5
    get '/?page=5'
  end

  def test_page2
    get '/?page=2'
  end

  def test_page10
    get '/?page=10'
  end

  def test_page20
    get '/?page=20'
  end

end

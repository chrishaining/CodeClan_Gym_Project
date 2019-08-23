require("minitest/autorun")
require('minitest/rg')
require_relative("../fitness_class")

class FitnessClassTest < Minitest::Test

  def setup
    options = {'id' => 1, 'name' => 'Pilates'}
    @fitness_class1 = FitnessClass.new(options)
  end

  def test_fitness_class_name
    assert_equal('Pilates', @fitness_class1.name)
  end

  def test_fitness_class_id
    assert_equal(1, @fitness_class1.id)
  end

  #FINAL END
end

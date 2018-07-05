require './lib/binary_translator'
require 'minitest/autorun'
require 'minitest/pride'

class BinaryTranslatorTest < Minitest::Test
  def test_initiates_a_class
    skip
    bt = BinaryTranslator.new
    bt2 = BinaryTranslator.new
    assert_instance_of BinaryTranslator, bt
    assert_instance_of BinaryTranslator, bt2
  end

  def test_translate_strings_to_binary
    bt = BinaryTranslator.new
    a_binary = bt.translate("a")
    z_binary = bt.translate("z")
    turing_binary = bt.translate("turing")
    assert_equal "000001", a_binary
    assert_equal "011010", z_binary
    assert_equal "010100010101010010001001001110000111", turing_binary
  end
end

require './lib/binary_translator'
require 'minitest/autorun'
require 'minitest/pride'
require "pry"

class BinaryTranslatorTest < Minitest::Test
  def test_initiates_a_class
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

  def test_translate_capital_letter_strings_to_binary
    bt = BinaryTranslator.new
    a_binary = bt.translate("a")
    a_capital = bt.translate("A")
    turing_binary = bt.translate("turing")
    turing_capital = bt.translate("TURING")
    assert_equal "000001", a_binary
    assert_equal "000001", a_capital
    assert_equal "010100010101010010001001001110000111", turing_capital
    assert_equal "010100010101010010001001001110000111", turing_binary
  end

  def test_characters_not_letters
    bt = BinaryTranslator.new
    character_binary1 = bt.translate("!@{$#%^&*()}")
    character_binary2 = bt.translate("!")
    character_binary3 = bt.translate("*")
    character_binary4 = bt.translate("~`_=[]|;:'/\'<>\".,-?+\\")
    assert_equal "", character_binary1
    assert_equal "", character_binary2
    assert_equal "", character_binary3
    assert_equal "", character_binary4
  end

  def test_translates_spaces
    bt = BinaryTranslator.new
    space_binary1 = bt.translate(" ")
    space_binary2 = bt.translate("   ")
    assert_equal "000000", space_binary1
    assert_equal "000000000000000000", space_binary2
  end

  def test_spaces_and_characters_handling
    bt = BinaryTranslator.new
    sentence1 = bt.translate("Hello World!")
    assert_equal "001000000101001100001100001111000000010111001111010010001100000100", sentence1
  end

  def test_binary_to_string_six_characters
    bt = BinaryTranslator.new
    array_of_six = bt.binary_to_strings("000001000010000011")
    assert_equal ["000001", "000010", "000011"], array_of_six
  end

  def test_complete_binary?
    bt = BinaryTranslator.new
    completion1 = bt.complete_binary?("000001000010000011")
    assert_equal true, completion1
    completion2 = bt.complete_binary?("000")
    assert_equal false, completion2
    completion3 = bt.complete_binary?("00101100")
    assert_equal false, completion3
  end

  def test_translate_to_text
    bt = BinaryTranslator.new
    sentence_1 = bt.translate_to_text("001000000101001100001100001111000000010111001111010010001100000100")
    assert_equal "hello world", sentence_1
    sentence_2 = bt.translate_to_text("0010001020304")
    assert_equal "Missing digits? Your binary is not complete?", sentence_2
  end
end

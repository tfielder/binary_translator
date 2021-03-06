
class BinaryTranslator
  attr_reader :alpha_to_binary

  def initialize
    @alpha_to_binary = {
      "a" => "000001",
      "b" => "000010",
      "c" => "000011",
      "d" => "000100",
      "e" => "000101",
      "f" => "000110",
      "g" => "000111",
      "h" => "001000",
      "i" => "001001",
      "j" => "001010",
      "k" => "001011",
      "l" => "001100",
      "m" => "001101",
      "n" => "001110",
      "o" => "001111",
      "p" => "010000",
      "q" => "010001",
      "r" => "010010",
      "s" => "010011",
      "t" => "010100",
      "u" => "010101",
      "v" => "010110",
      "w" => "010111",
      "x" => "011000",
      "y" => "011001",
      "z" => "011010",
      " " => "000000"
    }
  end

  def translate(string)
    array_characters = string.downcase.delete("!@{$#%^&*()}~`_=[]|;:'/\'<>\".,-?+\\").chars
    array_for_string = []
    array_characters.each do |char|
      array_for_string.push(@alpha_to_binary[char])
    end
    return array_for_string.join
  end

  def binary_to_strings(binary)
    binary.scan(/....../)
  end

  def complete_binary?(string)
    (string.size.to_f % 6.0) == 0
  end

  def translate_to_text(binary)
    if complete_binary?(binary)
      array = binary_to_strings(binary)
      array.map! do |digits|
        digits = @alpha_to_binary.key(digits)
      end
      return array.join
    else
      return "Missing digits? Your binary is not complete?"
    end
  end

end

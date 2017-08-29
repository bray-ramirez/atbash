class Atbash

  CONSTANT = 'abcdefghijklmnopqrstuvwxyz'.freeze

  attr_reader :cipher


  def initialize cipher
    self.cipher = cipher
  end

  def decode encrypted_text
    decoder(encrypted_text)
  end

  private

  def cipher= _cipher
    raise(ArgumentError, 'Invalid cipher.') unless _cipher.chars.sort == constant_array

    @cipher = _cipher
  end

  def constant_array
    @constant_array ||= CONSTANT.chars
  end

  def decoder text
    decoded_text = text.chars.map { |c| mapping.fetch(c, c) }
    decoded_text.join
  end

  def mapping
    return @mapping if defined?(@mapping)

    @mapping = {}
    cipher_array.each_with_index { |c, index| @mapping[c] = constant_array[index] }

    @mapping
  end

  def cipher_array
    @cipher_array ||= cipher.chars
  end

end

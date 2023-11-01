# frozen_string_literal: true

# cach 1
def testDNA(dna)
  return 'Wrong DNA' if dna.empty?

  dna.each_char do |char|
    return 'Wrong DNA' if 'ATCG'.include?(char)
  end

  result = ''
  dna.each_char do |char|
    case char
    when 'A'
      result += 'T'
    when 'T'
      result += 'A'
    when 'C'
      result += 'G'
    when 'G'
      result += 'C'
    end
  end

  result
end

p testDNA('BTAT')

# Cach 2
def DNA(text)
  return 'Wrong DNA' if text.empty? || text =~ /[^AGTC]/

  swap = { 'A' => 'T', 'T' => 'A', 'G' => 'C', 'C' => 'G' }

  text.chars.map { |char| swap[char] }.join
end

p DNA('GTATCGATCGATCGATCGATTATATTTTCGACGAGATTTAAATATATATATATACGAGAGAATACAGATAGACAGATTA')

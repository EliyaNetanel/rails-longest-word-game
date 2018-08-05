require "open-uri"

class Game
  def self.run(letters, attempt)
    dictunary_hash = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{attempt}").read)
     attempt.split("").each do |letter|
       if letters.include? letter.upcase
         letters.delete(letter)
       else
        return [0, "not in the letters provided"]
       end
     end
     if dictunary_hash["found"] == false
      return [0, "not an english word"]
     else
      return [dictunary_hash["length"] || 0, "well done!"]
     end
  end
end


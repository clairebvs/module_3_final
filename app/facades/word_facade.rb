class WordFacade
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def sentences
    service.sentences_british_canadian.map do |sentence_data|
      Sentence.new(sentence_data)
    end
  end

  private

  def service
    OxfordService.new(word)
  end
end

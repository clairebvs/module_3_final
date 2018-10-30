class OxfordService
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def sentences_data
    JSON.parse(response.body, symbolize_names: true)[:results][0][:lexicalEntries][0][:sentences].map do |sentence|
      if sentence[:regions] == ["British"] || sentence[:regions] == ["Canadian"]
        sentence
      end
    end
  end

  def sentences_british_canadian
    array_sentences_brit_can = []
    sentences_data.map do |sentence|
      if sentence != nil
        array_sentences_brit_can << sentence
      end
    end
    return array_sentences_brit_can
  end

  def response
    conn.get("api/v1/entries/en/#{@word}/sentences")
  end

  private
  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = ENV['oxford_api_id']
      faraday.headers["app_key"] = ENV['oxford_api_key']
      faraday.adapter  Faraday.default_adapter
    end
  end

end

class WordFacade
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def sentences
    conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = ENV['oxford_api_id']
      faraday.headers["app_key"] = ENV['oxford_api_key']
      faraday.adapter  Faraday.default_adapter
    end

    response = conn.get("api/v1/entries/en/strong/sentences")

    x = JSON.parse(response.body, symbolize_names: true)[:results][0][:lexicalEntries][0][:sentences].map do |sentence|
      array_sentences_brit_can = []
      if sentence[:regions] == ["British"] || sentence[:regions] == ["Canadian"]
        sentence
      end
    end
      require "pry"; binding.pry

  end
end

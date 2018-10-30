require 'rails_helper'

describe OxfordService do
  subject {OxfordService.new("mindfulness") }

  it 'exists' do
    expect(subject).to be_a(OxfordService)
  end

  context 'instance methods' do
    context '#sentences_british_canadian' do
      it 'returns all sentences (british and canadian) for a word' do
        data_sentences = subject.sentences_british_canadian
        data_sentence  = data_sentences.first

        expect(data_sentence).to have_key :regions
        expect(data_sentence).to have_key :senseIds
        expect(data_sentence).to have_key :text
      end
    end
  end
end

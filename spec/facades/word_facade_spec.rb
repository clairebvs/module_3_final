require 'rails_helper'

describe WordFacade do
  subject { WordFacade.new("mindfulness") }

  it 'exists' do
    expect(subject).to be_a(WordFacade)
  end

  context 'instance methods' do
    context '#sentences' do
      it 'returns all sentences for a word' do
        expect(subject.sentences.first).to be_a(Sentence)
      end
    end
  end
end

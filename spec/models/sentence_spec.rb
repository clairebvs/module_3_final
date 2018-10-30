require 'rails_helper'

describe Sentence do
  let(:sentence_data) {
      {:regions =>["British"],
       :senseIds=>["b-en-es0047516.016", "m_en_gbus1003730.017"],
       :text=>"Moose are strong swimmers and can cruise at speeds of 6 mph for up to two hours."}
    }

  subject { Sentence.new(sentence_data) }

  it "exists" do
    expect(subject).to be_a(Sentence)
  end

  context "instance methods" do
    context "#text" do
      it "returns a sentence" do
        expect(subject.text).to eq("Moose are strong swimmers and can cruise at speeds of 6 mph for up to two hours.")
      end
    end
  end
end

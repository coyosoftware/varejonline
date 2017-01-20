require 'spec_helper'

describe Varejonline do
  it 'has a version number' do
    expect(Varejonline::VERSION).not_to be nil
  end

  it 'returns a new Varejonline::Client' do
    expect(Varejonline.new("abc").class).to eq(Varejonline::Client)
  end
end

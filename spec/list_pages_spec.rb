# frozen_string_literal: true

require_relative '../lib/list_pages'
require_relative '../lib/file_reader'
require 'spec_helper'

RSpec.describe ListPages do
  let(:logs) { FileReader.new('spec/files/example.log').parse }

  subject { described_class.new(logs, uniq: uniq) }

  context 'when wants list all pages views' do
    let(:uniq) { nil }

    it 'returns correct list ' do
      expect(subject.call).to eq([['/about', 2], ['/index', 1]])
    end
  end

  context 'when wants list all uniq pages views ' do
    let(:uniq) { true }

    it 'returns correct list ' do
      expect(subject.call).to eq([['/about', 1], ['/index', 1]])
    end
  end
end

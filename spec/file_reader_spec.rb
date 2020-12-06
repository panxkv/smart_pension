# frozen_string_literal: true

require_relative '../lib/file_reader'
require 'spec_helper'

RSpec.describe FileReader do
  subject { described_class.new('spec/files/example.log') }

  it 'creates an instance of FileReader' do
    expect(subject).to be_kind_of(FileReader)
  end

  it 'returns correct data' do
    expect(subject.parse).to eq([OpenStruct.new(page: '/index', ip: '802.683.925.780'),
                                 OpenStruct.new(page: '/about', ip: '929.398.951.889'),
                                 OpenStruct.new(page: '/about', ip: '929.398.951.889')])
  end
end

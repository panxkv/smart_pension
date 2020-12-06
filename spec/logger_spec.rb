# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Logger do
  let(:logs) { [['/index', 10], ['/home', 100]] }

  describe '#print_str' do
    it 'prints correct string' do
      expect($stdout).to receive(:write).with("\e[32mText\e[0m\n")

      described_class.print_str('Text', :green)
    end
  end

  describe '#print_logs' do
    it 'prints correct string' do
      expect($stdout).to receive(:write).with("\e[32mPage: /index Views: 10\e[0m\n")
      expect($stdout).to receive(:write).with("\e[32mPage: /home Views: 100\e[0m\n")

      described_class.print_logs(logs)
    end
  end
end

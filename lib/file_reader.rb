# frozen_string_literal: true

require 'logger'
require 'ostruct'

class FileReader
  def initialize(path, batch_size = 1000)
    @path = path
    @batch_size = batch_size
    @result = []
  end

  def parse
    return Logger.print_str("No such file or directory #{@path}", :red) unless File.exist? @path

    File.open(@path.to_s) do |file|
      file.lazy.each_slice(@batch_size) do |lines|
        lines.map do |line|
          line = line.split("\s")

          @result << OpenStruct.new(page: line[0], ip: line[1])
        end
      end
    end

    @result
  end
end

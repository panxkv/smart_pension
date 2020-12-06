# frozen_string_literal: true

class Logger
  class << self
    def print_str(str, color = :white)
      $stdout.write(colorize(str, color.to_sym))
    end

    def print_logs(logs)
      logs.map { |l| print_str("Page: #{l[0]} Views: #{l[1]}", :green) }
    end

    private

    def colors
      @colors ||= {
        red: 31,
        green: 32,
        yellow: 33
      }
    end

    def colorize(str, color_code)
      "\e[#{colors[color_code]}m#{str}\e[0m\n"
    end
  end
end

# frozen_string_literal: true

class ListPages
  def initialize(logs, uniq: false)
    @logs = logs
    @uniq = uniq
  end

  def call
    uniq(@logs) if @uniq
    group_by_page
  end

  private

  def uniq(logs)
    @logs = logs.uniq { |line| [line.page, line.ip] }
  end

  def group_by_page
    @logs = @logs.group_by(&:page).transform_values(&:count).sort_by(&:last).reverse
  end
end
